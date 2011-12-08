#$(call inherit-product, build/target/product/full.mk)

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/device/lge/aloha/prelink-linux-arm.map

DEVICE_PACKAGE_OVERLAYS += device/lge/alohag/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/alohag/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    librs_jni \
	libmm-omxcore \
    libOmxCore \
    brcm_patchram_plus \
    gps.alohag \
    copybit.alohag

PRODUCT_PACKAGES += \
    flash_image \
    dump_image \
    erase_image \
    e2fsck

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    device/lge/alohag/files/alohag.kcm.bin:system/usr/keychars/alohag.kcm.bin \
    device/lge/alohag/files/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/lge/alohag/files/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/lge/alohag/files/alohag.kl:system/usr/keylayout/alohag.kl \
    device/lge/alohag/files/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/lge/alohag/files/qwerty.kl:system/usr/keylayout/qwerty.kl 
   
# Board-specific init (does not support charging in "power off" state yet)
PRODUCT_COPY_FILES += \
    device/lge/alohag/files/init.alohag.rc:root/init.alohag.rc \
    device/lge/alohag/files/initlogo.rle:root/initlogo.rle \
    device/lge/alohag/files/init.qcom.post_boot.sh:root/init.qcom.post_boot.sh

# 2D (using proprietary because of poor perfomance of open source libs)
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/lge/alohag/proprietary/lib/hw/gralloc.alohag.so:system/lib/hw/gralloc.alohag.so \

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/lib/hw/sensors.aloha.so:system/lib/hw/sensors.alohag.so \
    vendor/lge/alohag/proprietary/bin/akmd2:system/bin/akmd2 \
    vendor/lge/aloha/proprietary/lib/hw/lights.aloha.so:system/lib/hw/lights.msm7k.so \

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/alohag/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/alohag/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/alohag/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/alohag/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/alohag/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/alohag/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/alohag/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/alohag/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \


# Wifi
PRODUCT_COPY_FILES += \
    device/lge/alohag/files/lib/modules/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/alohag/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/lge/alohag/proprietary/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/lge/alohag/proprietary/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/alohag/proprietary/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/alohag/proprietary/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

# SD Card
PRODUCT_COPY_FILES += \
    device/lge/alohag/files/etc/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_COPY_FILES += \
    device/lge/alohag/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/lge/alohag/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/lge/alohag/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    device/lge/alohag/files/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml 

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/bin/qmuxd:system/bin/qmuxd \

# rmt_storage (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/bin/rmt_storage:system/bin/rmt_storage \

# port-bridge (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/bin/port-bridge:system/bin/port-bridge \

# Touchscreen firmware updater
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/bin/tsdown:system/bin/tsdown \
    
# netmgr (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/alohag/proprietary/lib/libdsutils.so:system/lib/libdsutils.so \
    vendor/lge/alohag/proprietary/lib/libnetmgr.so:system/lib/libnetmgr.so

PRODUCT_COPY_FILES += \
    device/lge/alohag/files/etc/apns-conf.xml:system/etc/apns-conf.xml \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \
    ro.sf.lcd_density=240 \
    ro.com.google.clientidbase=android-lge \
    ro.com.google.clientidbase.ms=android-lge \
    ro.com.google.clientidbase.gmm=android-lge \
    ro.com.google.clientidbase.yt=android-lge \
    ro.com.google.clientidbase.am=android-lge \

# Move dalvik-cache to /data
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \

# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/alohag/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/alohag/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/alohag/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/alohag/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/alohag/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/alohag/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/alohag/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/alohag/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/alohag/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/alohag/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/alohag/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/alohag/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/alohag/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/alohag/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/alohag/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/alohag/proprietary/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/alohag/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/alohag/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/alohag/proprietary/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/alohag/proprietary/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/alohag/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/alohag/proprietary/bin/rild:system/bin/rild 

#propietary libril
#PRODUCT_COPY_FILES += \
#    vendor/lge/alohag/proprietary/lib/libril.so:system/lib/libril.so \

# OMX
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/lib/libmm-abl.so:system/lib/libmm-abl.so \
    vendor/lge/alohag/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/alohag/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/alohag/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/alohag/proprietary/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/alohag/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/alohag/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/alohag/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/alohag/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/alohag/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/alohag/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/alohag/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/alohag/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/alohag/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/alohag/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/lge/alohag/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/alohag/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/alohag/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/alohag/proprietary/bin/BCM4329B1_002.002.023.0313.0341.hcd:system/bin/BCM4329B1_002.002.023.0313.0341.hcd \

PRODUCT_LOCALES += hdpi

$(call inherit-product, device/common/gps/gps_us.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_alohag
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := alohag
PRODUCT_MODEL := LG-Shine-Plus
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=alohag
