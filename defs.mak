#Copyright (C) 2007 L. Donnie Smith

PACKAGE_NAME = CWiid
PACKAGE_TARNAME = cwiid
PACKAGE_VERSION = 0.6.00
PACKAGE_STRING = CWiid 0.6.00
PACKAGE_BUGREPORT = cwiid@abstrakraft.org

prefix = /system
exec_prefix = ${prefix}

sysconfdir = ${prefix}/etc
libdir = ${exec_prefix}/lib

datarootdir = ${prefix}/share
mandir = ${datarootdir}/man
docdir = ${datarootdir}/doc/${PACKAGE_TARNAME}

COMMON = /home/audicken/workspace/android-native/apps_native/cwiid/cwiid-0.6.00/common

CC = $(COMMON)/../agcc
AWK = gawk
LEX = flex
YACC = bison -y
PYTHON = 

ifdef DESTDIR
	ROOTDIR = $(DESTDIR:%/=%)
endif

CWIID_CONFIG_DIR = $(ROOTDIR)${sysconfdir}/cwiid
CWIID_PLUGINS_DIR = $(ROOTDIR)${libdir}/cwiid/plugins

ANDROIDSDK = $(COMMON)/../android-sdk

DEBUGFLAGS = -g
WARNFLAGS = -Wall -W
CFLAGS = $(DEBUGFLAGS) $(WARNFLAGS) -DHAVE_CONFIG_H -I$(COMMON)/include \
	-I$(ANDROIDSDK)/external/bluetooth/bluez/include \
	-I$(ANDROIDSDK)/external/bluetooth/bluez/utils/common \
	-DPTHREAD_CANCEL_ENABLE=0 \
	-DPTHREAD_CANCEL_DISABLE=1 \
	-DPTHREAD_CANCELED=0 \
	-mabi=aapcs-linux
