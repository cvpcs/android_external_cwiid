LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	parser.c lexer.c \
	c_plugin.c uinput.c util.c \
	conf.c action_enum.c
LOCAL_C_INCLUDES += \
	external/bluetooth/bluez/include \
	$(LOCAL_PATH)/../libcwiid \
	$(LOCAL_PATH)/../common/include
LOCAL_CFLAGS += -DHAVE_CONFIG_H
LOCAL_SHARED_LIBRARIES += libcwiid libdl
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libwminput
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	parser.c lexer.c \
	c_plugin.c uinput.c util.c \
	conf.c action_enum.c
LOCAL_C_INCLUDES += \
	external/bluetooth/bluez/include \
	$(LOCAL_PATH)/../libcwiid \
	$(LOCAL_PATH)/../common/include
LOCAL_CFLAGS += \
	-DHAVE_CONFIG_H \
	-DCWIID_STATIC

#add plugins
LOCAL_SRC_FILES+= \
	plugins/acc/acc.c \
	plugins/classic_stick2btn/classic_stick2btn.c \
	plugins/ir_ptr/ir_ptr.c \
	plugins/led/led.c \
	plugins/nunchuk_acc/nunchuk_acc.c \
	plugins/nunchuk_stick2btn/nunchuk_stick2btn.c

LOCAL_STATIC_LIBRARIES += libcwiid libm
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libwminput
include $(BUILD_STATIC_LIBRARY)

include $(call all-subdir-makefiles)
