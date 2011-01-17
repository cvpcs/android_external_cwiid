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

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	main.c
LOCAL_C_INCLUDES += \
	external/bluetooth/bluez/include \
	$(LOCAL_PATH)/../common/include \
	$(LOCAL_PATH)/../libcwiid \
	$(LOCAL_PATH)/../libwminput
LOCAL_CFLAGS += \
	-DWMINPUT_CONFIG_DIR=\"/sdcard/.cwiid/wminput\" \
	-DCWIID_PLUGINS_DIR=\"/system/lib\" \
	-DHAVE_CONFIG_H \
	-DCWIID_STATE_SYSTEM_PROP=\"sys.cwiid.status\" \
	-DDEFAULT_CONFIG_FILE=\".autopreset\" \
	-DCWIID_STATIC
LOCAL_STATIC_LIBRARIES += libcwiid libwminput libcutils libm
LOCAL_SHARED_LIBRARIES += libbluetooth
LOCAL_MODULE := utility_wminput
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_PATH := $(PRODUCT_OUT)/utilities
LOCAL_UNSTRIPPED_PATH := $(PRODUCT_OUT)/symbols/utilities
LOCAL_MODULE_STEM := wminput
include $(BUILD_EXECUTABLE)
