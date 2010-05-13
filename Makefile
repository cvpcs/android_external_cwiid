#Copyright (C) 2007 L. Donnie Smith

include ./defs.mak

LIB_DIRS = libcwiid libwminput
BIN_DIRS = wminput lswm
DOC_DIRS = man doc
ifdef PYTHON
BIND_DIRS = python
endif

SUB_DIRS = $(LIB_DIRS) $(BIN_DIRS) $(DOC_DIRS) $(BIND_DIRS)

all install clean distclean uninstall: TARGET += $(MAKECMDGOALS)

all install clean distclean uninstall: $(BIN_DIRS) $(LIB_DIRS) $(BIND_DIRS)

install uninstall distclean: $(DOC_DIRS)

all clean distclean:

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(MAKECMDGOALS),distclean)
$(BIN_DIRS) $(BIND_DIRS): $(LIB_DIRS)
endif
endif

ifeq ($(MAKECMDGOALS),install)
$(BIN_DIRS) $(LIB_DIRS): $(CWIID_CONFIG_DIR) $(CWIID_PLUGINS_DIR)
endif

$(SUB_DIRS):
	$(MAKE) $(TARGET) -C $@

$(CWIID_CONFIG_DIR):
	install -d $(CWIID_CONFIG_DIR)

$(CWIID_PLUGINS_DIR):
	install -d $(CWIID_PLUGINS_DIR)

distclean:
	rm -rf Makefile config.log config.status autom4te.cache \
		defs.mak $(COMMON)/include/lib.mak $(COMMON)/include/config.h

uninstall:
	rm -r $(CWIID_PLUGINS_DIR); true

uninstall_config:
	rm -rf $(CWIID_CONFIG_DIR)

.PHONY: all install clean distclean uninstall uninstall_config $(SUB_DIRS)

.NOTPARALLEL: