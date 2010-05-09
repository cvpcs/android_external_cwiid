#Copyright (C) 2006 L. Donnie Smith

include ../defs.mak

LIB_NAME = wminput
MAJOR_VER = 1
MINOR_VER = 0

SOURCES = conf.c uinput.c action_enum.c c_plugin.c util.c
LAST_SOURCES = parser.c lexer.c

CFLAGS += -I../libcwiid
LDFLAGS += -L../libcwiid
LDLIBS += -lcwiid -ldl

YFLAGS += -d

SOURCES += $(LAST_SOURCES)

OBJECTS = $(SOURCES:.c=.o)
DEPS    = $(SOURCES:.c=.d)

LIB_INST_DIR = ${exec_prefix}/lib
INC_INST_DIR = ${prefix}/include

include $(COMMON)/include/lib.mak

$(SHARED_LIB): $(SO_NAME) $(LINK_NAME)

$(SO_NAME):
	ln -sf $(SHARED_LIB) $(SO_NAME)

$(LINK_NAME):
	ln -sf $(SO_NAME) $(LINK_NAME)

conf.o lexer.c: y.tab.h

y.tab.h: parser.c
	ln -s y.tab.h parser.h

action_enum.c: action_enum.awk action_enum.txt
	$(AWK) -f action_enum.awk action_enum.txt > action_enum.c

clean: remove_links clean_gen

remove_links:
	rm -f $(SO_NAME) $(LINK_NAME)

clean_gen:	
	rm -f action_enum.c parser.c lexer.c y.tab.h parser.h

distclean: clean
	rm Makefile

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(MAKECMDGOALS),distclean)
include $(COMMON)/include/dep.mak
-include $(DEPS)
endif
endif

.PHONY: distclean clean make_links remove_links
