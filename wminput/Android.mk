SAVED_MAKEFILES := $(call all-subdir-makefiles)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	main.c
LOCAL_C_INCLUDES += \
	external/bluetooth/bluez/include \
	$(LOCAL_PATH)/../common/include \
	$(LOCAL_PATH)/../libcwiid \
	$(LOCAL_PATH)/../libwminput
LOCAL_CFLAGS += \
	-DWMINPUT_CONFIG_DIR=\"/system/etc/cwiid/wminput\" \
	-DCWIID_PLUGINS_DIR=\"/system/lib/cwiid/plugins\" \
	-DHAVE_CONFIG_H
LOCAL_SHARED_LIBRARIES += libcwiid libdl libwminput
LOCAL_STATIC_LIBRARIES += libcutils
LOCAL_MODULE := wminput
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
include $(BUILD_EXECUTABLE)

include $(SAVED_MAKEFILES)
