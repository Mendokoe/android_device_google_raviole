#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
$(call inherit-product, vendor/matrixx/config/common_full_phone.mk)

#Matrixx Flags
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_ENABLE_BLUR := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_CUSTOM_UDFPS := true
BYPASS_CHARGE_SUPPORTED := true
MATRIXX_BUILD_TYPE := Unofficial
MATRIXX_MAINTAINER := srly8
TARGET_SUPPORTED_REFRESH_RATES := 60,90,120
WITH_GMS := true
TARGET_INCLUDE_PIXEL_LAUNCHER := true
TARGET_DEFAULT_PIXEL_LAUNCHER := false
WITH_GMS_COMMS_SUITE := true
WITH_GMS_AICORE := true
WITH_BCR := true
PRODUCT_NO_CAMERA := true
TARGET_SUPPORTS_QUICK_TAP := true

# Inherit device configuration
DEVICE_CODENAME := raven
DEVICE_PATH := device/google/raviole
VENDOR_PATH := vendor/google/raven
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6 Pro
PRODUCT_NAME := matrixx_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="raven-user 16 BP4A.251205.006 14401865 release-keys" \
    BuildFingerprint=google/raven/raven:16/BP4A.251205.006/14401865:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
