ifeq ($(TARGET_PRODUCT),mid7306ce)

.PHONY: custom1
custom1:
	echo "begin copy init custom848L files...."
# subtitle
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/playermenu.java   $(shell pwd)/packages/amlogic/VideoPlayer/src/com/farcore/videoplayer/
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/SubtitleView.java $(shell pwd)/packages/amlogic/SubTitle/src/com/subtitleview/
	
# baidu input method
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/DatabaseHelper.java  $(shell pwd)/frameworks/base/packages/SettingsProvider/src/com/android/providers/settings/

# logo 
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/init.c $(shell pwd)/system/core/init/
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/BootAnimation.cpp $(shell pwd)/frameworks/base/cmds/bootanimation/
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/BootAnimation.h $(shell pwd)/frameworks/base/cmds/bootanimation/
	
# ac3 dts
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/audiodsp_codec_ac3.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/audiodsp_codec_dca.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/audiodsp_codec_ddp_dcv.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
		
# build info
	#cp  $(shell pwd)/device/amlogic/mid7306ce/custom/buildinfo/Makefile  $(shell pwd)/build/core/
	#cp  $(shell pwd)/device/amlogic/mid7306ce/custom/buildinfo/version_defaults.mk  $(shell pwd)/build/core/
	#cp  $(shell pwd)/device/amlogic/mid7306ce/custom/buildinfo/buildinfo.sh  $(shell pwd)/build/tools/
	#cp  $(shell pwd)/device/amlogic/mid7306ce/custom/buildinfo/aml_update_packer  $(shell pwd)/build/tools/releasetools/

#zhoushuanghua fix: display PC connect when use PC line connect PC ,not charge
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/BatteryService.java $(shell pwd)/frameworks/base/services/java/com/android/server/
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/BatteryController.java $(shell pwd)/frameworks/base/packages/SystemUI/src/com/android/systemui/statusbar/policy/
	
#Adjustment Camer menu position
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/IndicatorControlWheel.java $(shell pwd)/packages/apps/Camera/src/com/android/camera/ui/
		
#Remove Baseband version in Setting
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/DeviceInfoSettings.java $(shell pwd)/packages/apps/Settings/src/com/android/settings/

#modify default Network address
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/strings.xml $(shell pwd)/packages/apps/Browser/res/values/

#modify input method position
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/dimens.xml $(shell pwd)/packages/inputmethods/LatinIME/java/res/values-sw600dp-land/
#when set ro.sf.lcd_density=160 
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/PhoneWindowManager.java $(shell pwd)/frameworks/base/policy/src/com/android/internal/policy/impl/
#Lauch change to 6*4
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/Launcher2/res/values-sw600dp/dimens.xml $(shell pwd)/packages/apps/Launcher2/res/values-sw600dp/
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/Launcher2/res/values-sw600dp/styles.xml $(shell pwd)/packages/apps/Launcher2/res/values-sw600dp/
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/Launcher2/res/layout-sw600dp/workspace.xml $(shell pwd)/packages/apps/Launcher2/res/layout-sw600dp/
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/Launcher2/src/com/android/launcher2/IconCache.java $(shell pwd)/packages/apps/Launcher2/src/com/android/launcher2/
#Lauch home page custon
#	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/Launcher2/res/xml/default_workspace.xml $(shell pwd)/packages/apps/Launcher2/res/xml/
    
#recovery add copy custom dir form sdcard when upgrade
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/recovery.c  $(shell pwd)/bootable/recovery/recovery.c
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/roots.c  $(shell pwd)/bootable/recovery/roots.c

#change default  background image
#	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/default_wallpaper.jpg $(shell pwd)/frameworks/base/core/res/res/drawable-large-nodpi/
#	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/default_wallpaper.jpg $(shell pwd)/frameworks/base/core/res/res/drawable-xlarge-nodpi/
# delete  default  soundrecorder apk
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/soundrecorder/_Android.mk   $(shell pwd)/packages/apps/SoundRecorder/Android.mk
#change mouse icon
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/OSD2CursorController.cpp $(shell pwd)/frameworks/base/services/input/

#modified bosch_bma250 sensor hal by martin
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/hardware/amlogic/sensors/bosch_bma250/sensors.cpp $(shell pwd)/hardware/amlogic/sensors/bosch_bma250/
#revert chumin's modification(80b49a6211dc692e7988a93f6d43461e304b8948)
	cp	$(shell pwd)/device/amlogic/mid7306ce/custom/packages/apps/Settings/src/com/android/settings/wifi/WifiSettings.java $(shell pwd)/packages/apps/Settings/src/com/android/settings/wifi

#change charging current for hena in kernel
	cp	$(shell pwd)/device/amlogic/mid7306ce/custom/axp20-sply.c $(shell pwd)/kernel/drivers/amlogic/power/axp_power/axp20-sply.c
	
#enable Setting Allow mock locations
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/main.mk $(shell pwd)/build/core/
	echo "finish copy init custom mid7306ce files. please build the project."


.PHONY: custom2
custom2:
	echo "begin copy custom848L files...."

#Customized  factory test function apk 	
	cp -r $(shell pwd)/device/amlogic/mid7306ce/custom/app  $(shell pwd)/out/target/product/mid7306ce/system/
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/libfactoryjni.so   $(shell pwd)/out/target/product/mid7306ce/system/lib/
#chmod root permission
	cp  $(shell pwd)/device/amlogic/mid7306ce/custom/su   $(shell pwd)/out/target/product/mid7306ce/system/xbin/
	echo "finish copy custom848L files. please build the project."

endif