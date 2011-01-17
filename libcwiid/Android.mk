LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	bluetooth.c command.c \
	connect.c interface.c \
	process.c state.c \
	thread.c util.c
LOCAL_C_INCLUDES += \
	external/bluetooth/bluez/include \
	$(LOCAL_PATH)/../common/include
LOCAL_CFLAGS += \
	-DHAVE_CONFIG_H \
	-DPTHREAD_CANCEL_ENABLE=0 \
	-DPTHREAD_CANCEL_DISABLE=1 \
	-DPTHREAD_CANCELED=0
LOCAL_SHARED_LIBRARIES += libbluetooth
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libcwiid
include $(BUILD_SHARED_LIBRARY)
