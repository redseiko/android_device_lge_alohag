## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := alohag

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/alohag/device_alohag.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := alohag
PRODUCT_NAME := cm_alohag
PRODUCT_BRAND := lge
PRODUCT_MODEL := alohag
PRODUCT_MANUFACTURER := lge
