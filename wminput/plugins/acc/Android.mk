LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	acc.c
LOCAL_C_INCLUDES += \
	external/bluetooth/bluez/include \
	$(LOCAL_PATH)/../../../common/include \
	$(LOCAL_PATH)/../../../libcwiid \
	$(LOCAL_PATH)/../../../libwminput
LOCAL_SHARED_LIBRARIES += libcwiid libm libwminput
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/cwiid/plugins
LOCAL_UNSTRIPPED_PATH := $(TARGET_OUT_SHARED_LIBRARIES_UNSTRIPPED)/cwiid/plugins
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := acc
include $(BUILD_SHARED_LIBRARY)
