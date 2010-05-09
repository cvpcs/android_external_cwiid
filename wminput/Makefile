#Copyright (C) 2007 L. Donnie Smith

include ../defs.mak

APP_NAME = wminput

SOURCES = main.c

WMINPUT_CONFIG_DIR = $(CWIID_CONFIG_DIR)/wminput
CFLAGS += -I../libcwiid \
	-I../libwminput \
	-DWMINPUT_CONFIG_DIR=\"$(WMINPUT_CONFIG_DIR)\" \
	-DCWIID_PLUGINS_DIR=\"$(CWIID_PLUGINS_DIR)\"

LDLIBS += -lcwiid -lwminput -ldl
LDFLAGS += -L../libcwiid -L../libwminput -rdynamic
INST_DIR = ${exec_prefix}/bin

YFLAGS += -d

ifdef PYTHON
	SOURCES += py_plugin.c
	CFLAGS += -I/usr/include/python
	LDLIBS += -lpython
endif

include $(COMMON)/include/app.mak

all install clean distclean uninstall: make_plugins

install: install_configs

#DON'T UNINSTALL CONFIGS
#uninstall: uninstall_configs

make_plugins:
	$(MAKE) $(MAKECMDGOALS) -C plugins

install_configs:
	install -d $(WMINPUT_CONFIG_DIR)
	install configs/* $(WMINPUT_CONFIG_DIR)
	ln -sf acc_ptr $(WMINPUT_CONFIG_DIR)/default

#uninstall_configs:
#	rm -f $(WMINPUT_CONFIG_DIR)/default
#	for c in `ls configs`; do				\
#		rm -f $(WMINPUT_CONFIG_DIR)/$$c;	\
#	done
#	rmdir $(WMINPUT_CONFIG_DIR); true

distclean: clean
	rm Makefile

.PHONY: all install clean distclean uninstall make_plugins clean_gen
