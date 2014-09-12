# Copyright (C) 2013 The CyanogenMod Project
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

LOCAL_PATH := device/motorola/msm8226-common

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

## overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8226 \
    audio_policy.msm8226 \
    libaudio-resampler \
    libaudioparameter \
    libqcomvisualizer \
    libqcompostprocbundle \
    libqcomvoiceprocessing \
    tinycap \
    tinymix \
    tinypcminfo \
    tinyplay

# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# FM radio
PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni \
    FM2 \
    FMRecord

# GPS
PRODUCT_PACKAGES += \
    gps.msm8226

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.izat.premium_enabled=1 \
    ro.qc.sdk.izat.service_mask=0x5 \
    persist.gps.qc_nlp_in_use=1 \
    persist.loc.nlp_name=com.qualcomm.services.location \
    ro.gps.agps_provider=1

# HAL
PRODUCT_PACKAGES += \
    copybit.msm8226\
    gralloc.msm8226 \
    hwcomposer.msm8226 \
    keystore.msm8226 \
    lights.msm8226 \
    memtrack.msm8226 \
    power.msm8226

# QRNG
PRODUCT_PACKAGES += qrngp

# Utilities
PRODUCT_PACKAGES += \
    charge_only_mode \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    wcnss_service

# Wifi
PRODUCT_COPY_FILES += \
    kernel/motorola/msm8226/drivers/net/wireless/prima/firmware_bin/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    kernel/motorola/msm8226/drivers/net/wireless/prima/firmware_bin/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/config/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Symlinks
PRODUCT_PACKAGES += WCNSS_qcom_wlan_factory_nv.bin

# Ramdisk
PRODUCT_PACKAGES += \
    bbx \
    fstab.qcom \
    gpecheck.sh \
    gpe-fstab.qcom \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc

# Init scripts
PRODUCT_PACKAGES += \
    init.mmi.boot.sh \
    init.mmi.rc \
    init.mmi.touch.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh \
    init.qcom.ssr.sh \
    init.qcom.wifi.sh

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/config/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/config/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/config/mixer_paths_boost.xml:system/etc/mixer_paths_boost.xml \
    $(LOCAL_PATH)/config/mixer_paths_p1.xml:system/etc/mixer_paths_p1.xml \
    $(LOCAL_PATH)/config/sap.conf:system/etc/sap.conf \
    $(LOCAL_PATH)/config/msap.conf:system/etc/msap.conf \
    $(LOCAL_PATH)/config/nfc-nci.conf:system/etc/nfc-nci.conf

# Charger - moto uses a funky ro.bootmode=mot-charger
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/moto_com.sh:system/bin/moto_com.sh

# EGL config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/egl.cfg:system/lib/egl/egl.cfg

# Location secuity configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/sec_config:system/etc/sec_config

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/config/media_codecs.xml:system/etc/media_codecs.xml

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.fb_always_on=1 \
    ro.hdmi.enable=true \
    tunnel.decode=false \
    tunnel.audiovideo.decode=false

#hwrelated
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.hw=1 \
	debug.egl.hw=1 \
	debug.composition.type=c2d \
	persist.hwc.mdpcomp.enable=true \
	debug.mdpcomp.logs=0 \
	dalvik.vm.heapsize=36m \
	dev.pm.dyn_samplingrate=1
    
# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    ro.audio.fm_max_volume=4096 \
    ro.qualcomm.cabl=0 \
    use.voice.path.for.pcm.voip=true \
    qcom.bt.le_dev_pwr_class=1 \
    ro.qc.sdk.audio.ssr=false \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.speaker=true \
    persist.audio.handset.mic=digital \
    persist.audio.fluence.mode=endfire\
    use.voice.path.for.pcm.voip=true \
    use.dedicated.device.for.voip=true \
    audio.offload.buffer.size.kb=32 \
    audio.offload.gapless.enabled=false \
    av.offload.enable=false \
    av.streaming.offload.enable=false \
    audio.offload.pcm.enable=false \
    mm.enable.smoothstreaming=true \
    qcom.hw.aac.encoder=true \
    persist.audio.calfile0=/etc/Bluetooth_cal.acdb \
    persist.audio.calfile1=/etc/General_cal.acdb \
    persist.audio.calfile2=/etc/Global_cal.acdb \
    persist.audio.calfile3=/etc/Handset_cal.acdb \
    persist.audio.calfile4=/etc/Hdmi_cal.acdb \
    persist.audio.calfile5=/etc/Headset_cal.acdb \
    persist.audio.calfile6=/etc/Speaker_cal.acdb \
    lpa.decode=true \
    lpa.use-stagefright=true


# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.usb.mtp=0x2e82 \
    ro.usb.mtp_adb=0x2e76 \
    ro.usb.ptp=0x2e83 \
    ro.usb.ptp_adb=0x2e84 \
    ro.usb.bpt=0x2e28 \
    ro.usb.bpt_adb=0x2e29 \
    ro.usb.bpteth=0x2e2a \
    ro.usb.bpteth_adb=0x2e2b \
    persist.gps.qc_nlp_in_use=0 \
    persist.fuse_sdcard=true \
    ro.crypto.fuse_sdcard=true \
    ro.nfc.port=I2C \
    ro.cwm.forbid_format="/fsg,/firmware,/persist,/boot"

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    persist.radio.msgtunnel.start=false \
    persist.sys.ssr.restart_level=3 \
    persist.sys.qc.sub.rdump.on=1 \
    telephony.lteOnCdmaDevice=0 \
    persist.radio.no_wait_for_card=1 \
    persist.radio.dfr_mode_set=1
    
#Radio RILD properties
PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.no_wait_for_card=1 \
	persist.radio.call_type=1 \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.radio.dfr_mode_set=1 \
	persist.radio.relay_oprt_change=1

# Opengles version 3
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/vendor/lib/libqc-opt.so

$(call inherit-product, device/motorola/qcom-common/qcom-common.mk)
