USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/alps/m72/BoardConfigVendor.mk

# Architecture
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := mt6572
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := m72

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456		
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456		
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400		
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2286419968	
BOARD_CACHEIMAGE_PARTITION_SIZE := 153092096		
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_MKBOOTIMG := $(HOST_OUT_EXECUTABLES)/mtkbootimg$(HOST_EXECUTABLE_SUFFIX)
BOARD_CUSTOM_BOOTIMG_MK := device/alps/m72/bootimg.mk
BOARD_MKBOOTIMG_ARGS := --mtk 1

TARGET_PREBUILT_KERNEL := device/alps/m72/prebuilt/kernel
TARGET_RECOVERY_INITRC := device/alps/m72/recovery/init.mt6572.rc
TARGET_RECOVERY_FSTAB := device/alps/m72/recovery/recovery.fstab

DEVICE_SCREEN_WIDTH := 1024
DEVICE_SCREEN_HEIGHT := 600


BOARD_HAS_NO_SELECT_BUTTON := true

#RECOVERY_VARIANT := twrp
#RECOVERY_VARIANT := philz
RECOVERY_VARIANT := carliv

ifneq ($(RECOVERY_VARIANT),carliv)
TARGET_RECOVERY_FSTAB := device/alps/m72/recovery/recovery.fstab
endif


# CARLIV
ifeq ($(RECOVERY_VARIANT),carliv)
BOARD_HAS_MTK := true
BOARD_NEEDS_MTK_GETSIZE := true
DEVICE_RESOLUTION := 1024x600
endif


# PHILZ
ifeq ($(RECOVERY_VARIANT),philz)
TARGET_COMMON_NAME := alps m72
BOARD_USE_MTK_LAYOUT := true
BOARD_MTK_BOOT_LABEL := "/bootimg"
BOARD_USE_NTFS_3G := false
BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/musb-hdrc.0/gadget/lun%d/file"
TARGET_SCREEN_HEIGHT := 600
TARGET_SCREEN_WIDTH := 1024
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
endif

# TWRP
ifeq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := device/alps/m72/recovery/twrp.fstab
TW_NO_EXFAT := true
TWHAVE_SELINUX := true
TW_THEME := portrait_mdpi
TW_NO_EXFAT_FUSE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/musb-hdrc.0/gadget/lun%d/file"
TW_EXCLUDE_SUPERSU := true
TARGET_RECOVERY_PIXEL_FORMAT := "BRGA_8888"
DEVICE_RESOLUTION := 1024x600
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
endif

