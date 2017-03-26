## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := m72

TARGET_SCREEN_HEIGHT := 1200
TARGET_SCREEN_WIDTH := 800

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/alps/m72/device_m72.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m72
PRODUCT_NAME := cm_m72
PRODUCT_BRAND := alps
PRODUCT_MODEL := m72
PRODUCT_MANUFACTURER := alps
