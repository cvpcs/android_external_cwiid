#Copyright (C) 2007 L. Donnie Smith

include ../../../defs.mak

PLUGIN_NAME = acc
SOURCES = acc.c
LDLIBS += -lm
INST_DIR = $(CWIID_PLUGINS_DIR)

include $(COMMON)/include/plugin.mak

distclean: clean
	rm Makefile

.PHONY: distclean
