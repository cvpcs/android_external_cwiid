SAVED_MAKEFILES := $(call all-subdir-makefiles)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	main.c
LOCAL_C_INCLUDES += \
	external/bluetooth/bluez/include \
	external/cwiid/common/include \
	external/cwiid/libcwiid \
	external/cwiid/libwminput
LOCAL_CFLAGS += \
	-DWMINPUT_CONFIG_DIR=\"/system/etc/cwiid/wminput\" \
	-DCWIID_PLUGINS_DIR=\"/system/lib/cwiid/plugins\" \
	-DHAVE_CONFIG_H
LOCAL_SHARED_LIBRARIES += libcwiid libdl libwminput
LOCAL_MODULE := wminput
include $(BUILD_EXECUTABLE)

include $(SAVED_MAKEFILES)
