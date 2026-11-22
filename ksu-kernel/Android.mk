LOCAL_PATH := $(call my-dir)

ifneq ($(filter oriole raven,$(TARGET_DEVICE)),)
.PHONY: ksu-verify
ksu-verify: $(PRODUCT_OUT)/boot.img
	-@bash $(LOCAL_PATH)/verify.sh
droidcore: ksu-verify
endif
