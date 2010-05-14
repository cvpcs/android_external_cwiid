LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	parser.c lexer.c \
	c_plugin.c uinput.c util.c \
	conf.c action_enum.c
LOCAL_C_INCLUDES += \
	external/bluetooth/bluez/include \
	external/cwiid/libcwiid \
	external/cwiid/common/include
LOCAL_CFLAGS += -DHAVE_CONFIG_H
LOCAL_SHARED_LIBRARIES += libcwiid libdl
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libwminput
include $(BUILD_SHARED_LIBRARY)
