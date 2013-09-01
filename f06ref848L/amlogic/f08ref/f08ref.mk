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
PRODUCT_NAME := f08ref
PRODUCT_MANUFACTURER := EMDOOR
PRODUCT_DEVICE := f08ref
PRODUCT_MODEL := ICS
PRODUCT_LOCALES := zh_CN en_US zh_TW \
	en_GB en_CA en_AU en_NZ en_SG es_ES \
	fr_FR fr_BE fr_CA fr_CH \
	it_IT it_CH \
	de_DE de_AT de_CH de_LI da_DK \
	ja_JP \
	nl_NL nl_BE nb_NO \
	cs_CZ \
	pl_PL pt_PT pt_BR \
	ru_RU \
	ko_KR \
	tr_TR \
	sv_SE \
	el_GR \
	mdpi hdpi

# Change this to match target country
# 11 North America; 14 Japan; 13 rest of world
PRODUCT_DEFAULT_WIFI_CHANNELS := 14

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage

PRODUCT_PACKAGES += \
	camera.amlogic \
	compasslib_h5_gcc_armv4t \
	compasslib_h6_gcc_armv4t \
	memsicd \
	sensors.amlogic \
	lights.amlogic \
	FileBrowser \
	AppInstaller \
	VideoPlayer \
	HdmiSwitch \
	audio_firmware \
	fw_env

# Camera
#PRODUCT_PACKAGES += \
	libcamera \
	libcamera_customize

#BlueTooth
#PRODUCT_PACKAGES += Bluetooth

# AML Standard RIL
PRODUCT_PACKAGES += \
	Phone       \
	usb_modeswitch \
	libaml-ril.so \
	init-pppd.sh \
	ip-up \
	chat

# Remote	
PRODUCT_PACKAGES += remotecfg

# Device specific system feature description
PRODUCT_COPY_FILES += \
	device/amlogic/f08ref/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml

# multitouch
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# focaltec Touch Screen
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ft5x06.idc:system/usr/idc/ft5x06.idc \
	$(LOCAL_PATH)/tcc-ts-goodix-cap.idc:system/usr/idc/tcc-ts-goodix-cap.idc

# Light sensor
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml

# Battery icons shown from uboot
PRODUCT_COPY_FILES += \
	device/amlogic/common/res/battery/0.rot270.bmp:system/resource/battery_pic/0.bmp \
	device/amlogic/common/res/battery/1.rot270.bmp:system/resource/battery_pic/1.bmp \
	device/amlogic/common/res/battery/2.rot270.bmp:system/resource/battery_pic/2.bmp \
	device/amlogic/common/res/battery/3.rot270.bmp:system/resource/battery_pic/3.bmp \
	device/amlogic/common/res/battery/4.rot270.bmp:system/resource/battery_pic/4.bmp \
	device/amlogic/common/res/battery/power_low.rot270.bmp:system/resource/battery_pic/power_low.bmp
	
# Wifi driver
PRODUCT_COPY_FILES += device/amlogic/f08ref/8192cu.ko:system/lib/8192cu.ko
PRODUCT_COPY_FILES += device/amlogic/f08ref/mali.ko:root/boot/mali.ko
PRODUCT_COPY_FILES += device/amlogic/f08ref/ump.ko:root/boot/ump.ko
PRODUCT_PACKAGES += wpa_supplicant.conf
PRODUCT_PACKAGES += hostapd_wps

#Superuser
BOARD_USE_ADD_SUPERUSER := false
ifeq ($(BOARD_USE_ADD_SUPERUSER),true)
PRODUCT_PACKAGES += \
	Superuser \
	su
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.factorytest.rc:root/init.factorytest.rc \
	$(LOCAL_PATH)/../common/res/logo/robot.800x480.rle:root/initlogo.rle.bak \
	$(LOCAL_PATH)/set_display_mode.sh:system/bin/set_display_mode.sh \
	$(LOCAL_PATH)/set_camera_clk.sh:system/bin/set_camera_clk.sh \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/asound.conf:system/etc/asound.conf \
	$(LOCAL_PATH)/asound.state:system/etc/asound.state \
	$(LOCAL_PATH)/android_I2C_Calibrate_V1_0:system/bin/android_I2C_Calibrate_V1_0 \
	$(LOCAL_PATH)/calibration.sh:system/bin/calibration.sh \
	$(LOCAL_PATH)/remote.conf:system/etc/remote.conf \
	$(LOCAL_PATH)/Vendor_0001_Product_0001.kl:/system/usr/keylayout/Vendor_0001_Product_0001.kl

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wififix.sh:system/bin/wififix.sh
# App optimization
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/liboptimization.so:system/lib/liboptimization.so
		
# Overlay for device specific settings
DEVICE_PACKAGE_OVERLAYS := device/amlogic/f08ref/overlay
