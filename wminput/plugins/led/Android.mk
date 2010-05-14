LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	led.c
LOCAL_C_INCLUDES += \
	external/bluetooth/bluez/include \
	external/cwiid/common/include \
	external/cwiid/libcwiid \
	external/cwiid/libwminput
LOCAL_SHARED_LIBRARIES += libcwiid libwminput
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/cwiid/plugins
LOCAL_UNSTRIPPED_PATH := $(TARGET_OUT_SHARED_LIBRARIES_UNSTRIPPED)/cwiid/plugins
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := led
include $(BUILD_SHARED_LIBRARY)
