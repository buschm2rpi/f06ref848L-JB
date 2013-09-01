ifeq ($(TARGET_PRODUCT),f06ref848L)

.PHONY: custom1
custom1:
	echo "begin copy init custom848L files...."
# subtitle
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/playermenu.java   $(shell pwd)/packages/amlogic/VideoPlayer/src/com/farcore/videoplayer/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/SubtitleView.java $(shell pwd)/packages/amlogic/SubTitle/src/com/subtitleview/
	
# baidu input method
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/DatabaseHelper.java  $(shell pwd)/frameworks/base/packages/SettingsProvider/src/com/android/providers/settings/

# logo 
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/init.c $(shell pwd)/system/core/init/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/BootAnimation.cpp $(shell pwd)/frameworks/base/cmds/bootanimation/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/BootAnimation.h $(shell pwd)/frameworks/base/cmds/bootanimation/
	
# ac3 dts
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/audiodsp_codec_ac3.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/audiodsp_codec_dca.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/audiodsp_codec_ddp_dcv.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
		
# build info
	#cp  $(shell pwd)/device/amlogic/f06ref848L/custom/buildinfo/Makefile  $(shell pwd)/build/core/
	#cp  $(shell pwd)/device/amlogic/f06ref848L/custom/buildinfo/version_defaults.mk  $(shell pwd)/build/core/
	#cp  $(shell pwd)/device/amlogic/f06ref848L/custom/buildinfo/buildinfo.sh  $(shell pwd)/build/tools/
	#cp  $(shell pwd)/device/amlogic/f06ref848L/custom/buildinfo/aml_update_packer  $(shell pwd)/build/tools/releasetools/

#zhoushuanghua fix: display PC connect when use PC line connect PC ,not charge
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/BatteryService.java $(shell pwd)/frameworks/base/services/java/com/android/server/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/BatteryController.java $(shell pwd)/frameworks/base/packages/SystemUI/src/com/android/systemui/statusbar/policy/
	
#Adjustment Camer menu position
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/IndicatorControlWheel.java $(shell pwd)/packages/apps/Camera/src/com/android/camera/ui/
		
#Remove Baseband version in Setting
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/DeviceInfoSettings.java $(shell pwd)/packages/apps/Settings/src/com/android/settings/

#modify default Network address
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/strings.xml $(shell pwd)/packages/apps/Browser/res/values/

#modify input method position
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/dimens.xml $(shell pwd)/packages/inputmethods/LatinIME/java/res/values-sw600dp-land/
#when set ro.sf.lcd_density=160 
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/PhoneWindowManager.java $(shell pwd)/frameworks/base/policy/src/com/android/internal/policy/impl/
#Lauch change to 6*4
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/Launcher2/res/values-sw600dp/dimens.xml $(shell pwd)/packages/apps/Launcher2/res/values-sw600dp/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/Launcher2/res/values-sw600dp/styles.xml $(shell pwd)/packages/apps/Launcher2/res/values-sw600dp/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/Launcher2/res/layout-sw600dp/workspace.xml $(shell pwd)/packages/apps/Launcher2/res/layout-sw600dp/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/Launcher2/src/com/android/launcher2/IconCache.java $(shell pwd)/packages/apps/Launcher2/src/com/android/launcher2/
#Lauch home page custon
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/Launcher2/res/xml/default_workspace.xml $(shell pwd)/packages/apps/Launcher2/res/xml/
    
#recovery add copy custom dir form sdcard when upgrade
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/recovery.c  $(shell pwd)/bootable/recovery/recovery.c
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/roots.c  $(shell pwd)/bootable/recovery/roots.c

#change default  background image
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/default_wallpaper.jpg $(shell pwd)/frameworks/base/core/res/res/drawable-large-nodpi/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/default_wallpaper.jpg $(shell pwd)/frameworks/base/core/res/res/drawable-xlarge-nodpi/

# delete  default  soundrecorder apk
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/soundrecorder/Android.c   $(shell pwd)/packages/apps/SoundRecorder/Android.mk

#change mouse icon
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/OSD2CursorController.cpp $(shell pwd)/frameworks/base/services/input/
#enable Setting Allow mock locations
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/main.mk $(shell pwd)/build/core/
	echo "finish copy init custom848L files. please build the project."


.PHONY: custom2
custom2:
	echo "begin copy custom848L files...."

#Customized  factory test function apk 	
	cp -r $(shell pwd)/device/amlogic/f06ref848L/custom/app  $(shell pwd)/out/target/product/f06ref848L/system/
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/libfactoryjni.so   $(shell pwd)/out/target/product/f06ref848L/system/lib/
#chmod root permission
	cp  $(shell pwd)/device/amlogic/f06ref848L/custom/su   $(shell pwd)/out/target/product/f06ref848L/system/xbin/
	echo "finish copy custom848L files. please build the project."

endif