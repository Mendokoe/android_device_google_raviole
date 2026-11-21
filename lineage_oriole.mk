#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
DEVICE_CODENAME := oriole
DEVICE_PATH := device/google/raviole
VENDOR_PATH := vendor/google/oriole
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

#Axion Flags
TARGET_INCLUDE_AXFX := true
AXION_CAMERA_REAR_INFO := 50,12
AXION_CAMERA_FRONT_INFO := 11
AXION_MAINTAINER := iConnanTxKurumi
AXION_PROCESSOR := Google Tensor

TARGET_DISABLES_LIBPERF ?= false
HBM_SUPPORTED := true
HBM_NODE := /sys/class/backlight/panel0-backlight/hbm_mode

TARGET_NEEDS_DOZE_FIX := false
TARGET_DOZE_TAP_PULSE_SUPPORTED ?= true
TARGET_DOZE_DOUBLE_TAP_PULSE_SUPPORTED ?= true
TARGET_DOZE_PICKUP_PULSE_SUPPORTED ?= true
TARGET_DOZE_SIDE_FPS_PULSE_SUPPORTED ?= false

# Ax Kernel Manager XML
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/kernel/ax_kernel_manager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ax_kernel_manager.xml

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="oriole-user 16 BP4A.251205.006 14401865 release-keys" \
    BuildFingerprint=google/oriole/oriole:16/BP4A.251205.006/14401865:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
