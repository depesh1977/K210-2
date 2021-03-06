#
# Copyright 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

PLATFORM_PATH := device/BQ/k210

LC_ALL=C
ALLOW_MISSING_DEPENDENCIES=true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait

TARGET_BOARD_PLATFORM := SP7731E

# Bootloader
TARGET_NO_BOOTLOADER := true 
TARGET_BOOTLOADER_BOARD_NAME := SP7731E

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 36700160
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 36700160
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1782579200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1782579200
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_PERSISTIMAGE_PARTITION_SIZE := 2097152
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_KEY_PATH := $(BOARD_AVB_KEY_PATH)
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(BOARD_AVB_ROLLBACK_INDEX)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 0

# Cmdline
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_CMDLINE += buildvariant=user

# Kernel
TARGET_KERNEL_ARCH := arm
BOARD_BOOT_HEADER_VERSION := 1
BOARD_KERNEL_BASE          := 0x00000000
BOARD_KERNEL_TAGS_OFFSET   := 0x00000100
BOARD_KERNEL_OFFSET        := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_RAMDISK_OFFSET       := 0x05400000
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_PAGESIZE := 2048
TARGET_PREBUILT_KERNEL := $(PLATFORM_PATH)/prebuilt/zImage
BOARD_PREBUILT_DTBOIMAGE := $(PLATFORM_PATH)/prebuilt/dtbo

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Fstab
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/prebuilt/recovery.fstab

# Filesystem
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# TWRP Stuff
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_THEME := portrait_hdpi
TW_USE_TOOLBOX := true
HAVE_SELINUX := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_LEGACY_PROPS := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_SCREEN_BLANK_ON_BOOT := false
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_NO_USB_STORAGE := false
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# Show build time on the splash screen
TW_DEVICE_VERSION=$(shell date '+%Y%m%d')

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2025-12-31

# Platform version
PLATFORM_VERSION := 16.1.0


