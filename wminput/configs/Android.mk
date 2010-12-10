LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

config_files := \
	buttons \
	gamepad
#	acc_led \
#	acc_ptr \
#	ir_ptr \
#	neverball \
#	nunchuk_acc_ptr \
#	nunchuk_stick2btn \

copy_to := $(addprefix $(TARGET_OUT)/etc/cwiid/wminput/,$(config_files))
copy_from := $(addprefix $(LOCAL_PATH)/,$(config_files))

$(copy_to) : PRIVATE_MODULE := system_etcdir
$(copy_to) : $(TARGET_OUT)/etc/cwiid/wminput/% : $(LOCAL_PATH)/% | $(ACP)
	$(transform-prebuilt-to-target)

ALL_PREBUILT += $(copy_to)
