# Copyright (C) 2011 Amlogic Inc
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
# This file is the build configuration for a full Android
# build for M1 reference board. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

#don't copy ringtons files to system
NEED_NO_RINGTONES := true
# Inherit from those products. Most specific first.
$(call inherit-product, device/amlogic/common/mid_amlogic.mk)

# Discard inherited values and use our own instead.
PLATFORM_VERSION_CODENAME := IceCreamSandwich
PRODUCT_NAME := f06ref848L
PRODUCT_MANUFACTURER := Ainol
PRODUCT_DEVICE := f06ref848L
PRODUCT_MODEL := NOVO7 Tornados
PRODUCT_LOCALES := en_US mdpi hdpi

# Change this to match target country
# 11 North America; 14 Japan; 13 rest of world
PRODUCT_DEFAULT_WIFI_CHANNELS := 11

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

PRODUCT_PACKAGES += \
	camera.amlogic \
	sensors.amlogic \
	lights.amlogic \
	FileBrowser \
	AppInstaller \
	VideoPlayer \
	audio_firmware \
	fw_env

# Camera
PRODUCT_PACKAGES += \
        camera.amlogic.so \
	libskia.so \
	libwebcore.so
#BlueTooth
#PRODUCT_PACKAGES += Bluetooth

# AML Standard RIL
PRODUCT_PACKAGES += \
	Phone \
	usb_modeswitch \
	libaml-ril.so \
	init-pppd.sh \
	ip-up \
	chat

PRODUCT_PACKAGES += SoundRecorder.apk
	
# Device specific system feature description
PRODUCT_COPY_FILES += \
	device/amlogic/f06ref848L/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/platform.xml:/system/etc/permissions/platform.xml

# multitouch
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# IPS-BD7248F Touch Screen
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ldwzic_ts.idc:system/usr/idc/ldwzic_ts.idc

# Traceball	
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/cheerchip-nav.idc:system/usr/idc/cheerchip-nav.idc


# Battery icons shown from uboot
PRODUCT_COPY_FILES += \
	device/amlogic/common/res/battery/G00.bmp:system/resource/battery_pic/G00.bmp \
	device/amlogic/common/res/battery/G01.bmp:system/resource/battery_pic/G01.bmp \
	device/amlogic/common/res/battery/G02.bmp:system/resource/battery_pic/G02.bmp \
	device/amlogic/common/res/battery/G03.bmp:system/resource/battery_pic/G03.bmp \
	device/amlogic/common/res/battery/G10.bmp:system/resource/battery_pic/G10.bmp \
	device/amlogic/common/res/battery/G11.bmp:system/resource/battery_pic/G11.bmp \
	device/amlogic/common/res/battery/G12.bmp:system/resource/battery_pic/G12.bmp \
	device/amlogic/common/res/battery/G13.bmp:system/resource/battery_pic/G13.bmp \
	device/amlogic/common/res/battery/G20.bmp:system/resource/battery_pic/G20.bmp \
	device/amlogic/common/res/battery/G21.bmp:system/resource/battery_pic/G21.bmp \
	device/amlogic/common/res/battery/G22.bmp:system/resource/battery_pic/G22.bmp \
	device/amlogic/common/res/battery/G23.bmp:system/resource/battery_pic/G23.bmp \
	device/amlogic/common/res/battery/G30.bmp:system/resource/battery_pic/G30.bmp \
	device/amlogic/common/res/battery/G31.bmp:system/resource/battery_pic/G31.bmp \
	device/amlogic/common/res/battery/G32.bmp:system/resource/battery_pic/G32.bmp \
	device/amlogic/common/res/battery/G33.bmp:system/resource/battery_pic/G33.bmp \
	device/amlogic/common/res/battery/Glow.bmp:system/resource/battery_pic/Glow.bmp
	
# Wifi driver
PRODUCT_COPY_FILES += device/amlogic/f06ref848L/8192cu.ko:system/lib/8192cu.ko
PRODUCT_COPY_FILES += device/amlogic/f06ref848L/mali.ko:root/boot/mali.ko
PRODUCT_COPY_FILES += device/amlogic/f06ref848L/ump.ko:root/boot/ump.ko
PRODUCT_PACKAGES += wpa_supplicant.conf
PRODUCT_PACKAGES += hostapd_wps

#Superuser
BOARD_USE_ADD_SUPERUSER := true
ifeq ($(BOARD_USE_ADD_SUPERUSER),true)
PRODUCT_PACKAGES += \
	Superuser \
	su
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.factorytest.rc:root/init.factorytest.rc \
	$(LOCAL_PATH)/../common/res/logo/ainol.800x480.rle:root/initlogo.rle.bak \
	$(LOCAL_PATH)/set_display_mode.sh:system/bin/set_display_mode.sh \
	$(LOCAL_PATH)/set_camera_clk.sh:system/bin/set_camera_clk.sh \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/asound.conf:system/etc/asound.conf \
	$(LOCAL_PATH)/asound.state:system/etc/asound.state \
	$(LOCAL_PATH)/audio_effects.conf:system/etc/audio_effects.conf \
	$(LOCAL_PATH)/Vendor_0001_Product_0001.kl:/system/usr/keylayout/Vendor_0001_Product_0001.kl

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wififix.sh:system/bin/wififix.sh
# App optimization
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/liboptimization.so:system/lib/liboptimization.so
		
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bootanimation.zip:system/media/bootanimation.zip
	
# Overlay for device specific settings
DEVICE_PACKAGE_OVERLAYS := device/amlogic/f06ref848L/overlay

# custom
include $(LOCAL_PATH)/custom.mk

##############################################################
# Extra JB settings found in grouper source directory
##############################################################
PRODUCT_CHARACTERISTICS := tablet
#
# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
