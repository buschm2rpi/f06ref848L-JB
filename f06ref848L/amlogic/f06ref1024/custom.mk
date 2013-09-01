ifeq ($(TARGET_PRODUCT),f06ref1024)

.PHONY: custom1
custom1:
	echo "begin copy init custom1024 files...."
# subtitle
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/playermenu.java   $(shell pwd)/packages/amlogic/VideoPlayer/src/com/farcore/videoplayer/
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/SubtitleView.java $(shell pwd)/packages/amlogic/SubTitle/src/com/subtitleview/
	
# baidu input method
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/DatabaseHelper.java  $(shell pwd)/frameworks/base/packages/SettingsProvider/src/com/android/providers/settings/

# logo 
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/init.c $(shell pwd)/system/core/init/
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/BootAnimation.cpp $(shell pwd)/frameworks/base/cmds/bootanimation/
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/BootAnimation.h $(shell pwd)/frameworks/base/cmds/bootanimation/
	
# ac3 dts
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/audiodsp_codec_ac3.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/audiodsp_codec_dca.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/audiodsp_codec_ddp_dcv.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
		
# build info
	#cp  $(shell pwd)/device/amlogic/f06ref1024/custom/buildinfo/Makefile  $(shell pwd)/build/core/
	#cp  $(shell pwd)/device/amlogic/f06ref1024/custom/buildinfo/version_defaults.mk  $(shell pwd)/build/core/
	#cp  $(shell pwd)/device/amlogic/f06ref1024/custom/buildinfo/buildinfo.sh  $(shell pwd)/build/tools/
	#cp  $(shell pwd)/device/amlogic/f06ref1024/custom/buildinfo/aml_update_packer  $(shell pwd)/build/tools/releasetools/

#zhoushuanghua fix: display PC connect when use PC line connect PC ,not charge
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/BatteryService.java $(shell pwd)/frameworks/base/services/java/com/android/server/
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/BatteryController.java $(shell pwd)/frameworks/base/packages/SystemUI/src/com/android/systemui/statusbar/policy/
	
#Remove Baseband version in Setting
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/DeviceInfoSettings.java $(shell pwd)/packages/apps/Settings/src/com/android/settings/
#modify default Network address
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/strings.xml $(shell pwd)/packages/apps/Browser/res/values/
#when set ro.sf.lcd_density=160 
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/PhoneWindowManager.java $(shell pwd)/frameworks/base/policy/src/com/android/internal/policy/impl/
    
#recovery add copy custom dir form sdcard when upgrade
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/recovery.c  $(shell pwd)/bootable/recovery/recovery.c
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/roots.c  $(shell pwd)/bootable/recovery/roots.c

#change default  background image
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/default_wallpaper.jpg $(shell pwd)/frameworks/base/core/res/res/drawable-large-nodpi/
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/default_wallpaper.jpg $(shell pwd)/frameworks/base/core/res/res/drawable-xlarge-nodpi/

# delete  default  soundrecorder apk
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/soundrecorder/Android.c   $(shell pwd)/packages/apps/SoundRecorder/Android.mk
	
#enable Setting Allow mock locations
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/main.mk $(shell pwd)/build/core/
	echo "finish copy init custom1024 files. please build the project."


.PHONY: custom2
custom2:
	echo "begin copy custom1024 files...."

		
#Customized  factory test function apk 	
	cp -r $(shell pwd)/device/amlogic/f06ref1024/custom/app  $(shell pwd)/out/target/product/f06ref1024/system/
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/libfactoryjni.so   $(shell pwd)/out/target/product/f06ref1024/system/lib/
#chmod root permission
	cp  $(shell pwd)/device/amlogic/f06ref1024/custom/su   $(shell pwd)/out/target/product/f06ref1024/system/xbin/
	echo "finish copy custom1024 files. please build the project."

endif
