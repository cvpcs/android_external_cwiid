/* Copyright (C) 2007 L. Donnie Smith <donnie.smith@gatech.edu>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */

#include "wmplugin.h"

/* Button flags */
#define LEFT_STICK_KEY_UP            0x0001
#define LEFT_STICK_KEY_DOWN          0x0002
#define LEFT_STICK_KEY_RIGHT         0x0004
#define LEFT_STICK_KEY_LEFT          0x0008
#define RIGHT_STICK_KEY_UP           0x0010
#define RIGHT_STICK_KEY_DOWN         0x0020
#define RIGHT_STICK_KEY_RIGHT        0x0040
#define RIGHT_STICK_KEY_LEFT         0x0080

#define STICK_MID_VAL           128
#define STICK_NEUTRAL           20

static unsigned char info_init = 0;
static struct wmplugin_info info;
static struct wmplugin_data data;

wmplugin_info_t wmplugin_info;
wmplugin_init_t wmplugin_init;
wmplugin_exec_t wmplugin_exec;
static void process_classic(struct cwiid_classic_mesg *mesg);

struct wmplugin_info *wmplugin_info() {
        if (!info_init) {
                info.button_count = 8;
                info.button_info[0].name = "LStick_Up";
                info.button_info[1].name = "LStick_Down";
                info.button_info[2].name = "LStick_Right";
                info.button_info[3].name = "LStick_Left";
                info.button_info[4].name = "RStick_Up";
                info.button_info[5].name = "RStick_Down";
                info.button_info[6].name = "RStick_Right";
                info.button_info[7].name = "RStick_Left";
                info.axis_count = 0;
                info_init = 1;
        }
        return &info;
}

int wmplugin_init(int id, cwiid_wiimote_t *arg_wiimote)
{
        data.buttons = 0;
        if (wmplugin_set_rpt_mode(id, CWIID_RPT_CLASSIC)) {
                return -1;
        }

        return 0;
}

struct wmplugin_data *wmplugin_exec(int mesg_count, union cwiid_mesg mesg[])
{
        int i;
        struct wmplugin_data *ret = NULL;

        for (i=0; i < mesg_count; i++) {
                switch (mesg[i].type) {
                case CWIID_MESG_CLASSIC:
                        process_classic(&mesg[i].classic_mesg);
                        ret = &data;
                        break;
                default:
                        break;
                }
        }

        return ret;
}

static void process_classic(struct cwiid_classic_mesg *mesg)
{
        int lstx = mesg->l_stick[CWIID_X];
        int lsty = mesg->l_stick[CWIID_Y];

	int rstx = mesg->r_stick[CWIID_X];
	int rsty = mesg->r_stick[CWIID_Y];

        data.buttons=0;
        if (lsty > STICK_MID_VAL+STICK_NEUTRAL) data.buttons |= LEFT_STICK_KEY_UP;
        if (lsty < STICK_MID_VAL-STICK_NEUTRAL) data.buttons |= LEFT_STICK_KEY_DOWN;
        if (lstx > STICK_MID_VAL+STICK_NEUTRAL) data.buttons |= LEFT_STICK_KEY_RIGHT;
        if (lstx < STICK_MID_VAL-STICK_NEUTRAL) data.buttons |= LEFT_STICK_KEY_LEFT;

        if (rsty > STICK_MID_VAL+STICK_NEUTRAL) data.buttons |= RIGHT_STICK_KEY_UP;
        if (rsty < STICK_MID_VAL-STICK_NEUTRAL) data.buttons |= RIGHT_STICK_KEY_DOWN;
        if (rstx > STICK_MID_VAL+STICK_NEUTRAL) data.buttons |= RIGHT_STICK_KEY_RIGHT;
        if (rstx < STICK_MID_VAL-STICK_NEUTRAL) data.buttons |= RIGHT_STICK_KEY_LEFT;
}
