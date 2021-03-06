#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

BOARD_VENDOR := motorola-qcom

# Platform
TARGET_BOARD_PLATFORM_GPU 	:= qcom-adreno305
TARGET_BOARD_PLATFORM 		:= msm8226
TARGET_BOOTLOADER_BOARD_NAME 	:= MSM8226
TARGET_CPU_VARIANT 		:= krait
TARGET_USE_KINGFISHER_OPTIMIZATION := true
TARGET_USES_ION := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

-include device/motorola/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/motorola/msm8226-common

TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# Inline kernel building
BOARD_KERNEL_SEPARATED_DT 	:= true
BOARD_CUSTOM_BOOTIMG_MK 	:= device/motorola/msm8226-common/mkbootimg.mk
TARGET_KERNEL_SOURCE 		:= kernel/motorola/msm8226
TARGET_KERNEL_CONFIG 		:= msm8226_mmi_defconfig
BOARD_KERNEL_CMDLINE 		:= console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 vmalloc=400M utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags androidboot.write_protect=0 zcache
BOARD_KERNEL_BASE 		:= 0x00000000
BOARD_KERNEL_PAGESIZE		:= 2048
BOARD_MKBOOTIMG_ARGS 		:= --ramdisk_offset 0x01000000 --tags_offset 0x00000100

BOARD_HAS_QCOM_WLAN_SDK :=

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# QCOM BSP
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# Audio
AUDIO_FEATURE_DISABLED_FM :=
AUDIO_FEATURE_DISABLED_SSR := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

# GPS
TARGET_NO_RPC := true

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/config/egl.cfg
TARGET_DISPLAY_USE_RETIRE_FENCE :=
TARGET_QCOM_DISPLAY_VARIANT := caf-new

# Enables Adreno RS driver
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_QCOM_MEDIA_VARIANT := caf-new

# Use qcom power hal
TARGET_POWERHAL_VARIANT := qcom

# Enable CPU boosting events in the power HAL
TARGET_USES_CPU_BOOST_HINT := true

TARGET_HW_DISK_ENCRYPTION := true

# Hardware tunables framework
BOARD_HARDWARE_CLASS := device/motorola/msm8226-common/cmhw/

# Assert
TARGET_OTA_ASSERT_DEVICE := xt1031,xt1032,xt1033,xt1034,xt1039,falcon_umts,falcon_umtsds,falcon_cdma,falcon_retuaws,falcon,falcon_gpe,peregrine

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT 	:= "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 	:= true
TARGET_USERIMAGES_USE_F2FS 	:= true
TW_EXTERNAL_STORAGE_PATH 	:= "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
BOARD_RECOVERY_SWIPE		:= true
# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1023410176
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5930614784
# userdata 8GB
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 8589934592
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_USB_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
HAVE_SELINUX := true

PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab

#Temporary hack : skip building external/chromium_org
#PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024
