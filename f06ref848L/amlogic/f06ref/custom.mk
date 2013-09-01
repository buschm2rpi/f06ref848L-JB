ifeq ($(TARGET_PRODUCT),f06ref)
.PHONY: custom
custom:
	echo "begin copy custom files...."
# subtitle
	cp  $(shell pwd)/device/amlogic/f06ref/custom/playermenu.java   $(shell pwd)/packages/amlogic/VideoPlayer/src/com/farcore/videoplayer/
	cp  $(shell pwd)/device/amlogic/f06ref/custom/SubtitleView.java $(shell pwd)/packages/amlogic/SubTitle/src/com/subtitleview/
	
# wifi
	cp  $(shell pwd)/device/amlogic/f06ref/custom/WifiService.java   $(shell pwd)/frameworks/base/services/java/com/android/server/
	
# baidu input method
	cp  $(shell pwd)/device/amlogic/f06ref/custom/DatabaseHelper.java  $(shell pwd)/frameworks/base/packages/SettingsProvider/src/com/android/providers/settings/

# logo 
	cp  $(shell pwd)/device/amlogic/f06ref/custom/init.c $(shell pwd)/system/core/init/
	cp  $(shell pwd)/device/amlogic/f06ref/custom/BootAnimation.cpp $(shell pwd)/frameworks/base/cmds/bootanimation/
	cp  $(shell pwd)/device/amlogic/f06ref/custom/BootAnimation.h $(shell pwd)/frameworks/base/cmds/bootanimation/
	
# ac3 dts
	cp  $(shell pwd)/device/amlogic/f06ref/custom/audiodsp_codec_ac3.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
	cp  $(shell pwd)/device/amlogic/f06ref/custom/audiodsp_codec_dca.bin  $(shell pwd)/packages/amlogic/LibPlayer/amadec/firmware/
	
# build info
	cp  $(shell pwd)/device/amlogic/f06ref/custom/buildinfo/Makefile  $(shell pwd)/build/core/
	cp  $(shell pwd)/device/amlogic/f06ref/custom/buildinfo/version_defaults.mk  $(shell pwd)/build/core/
	cp  $(shell pwd)/device/amlogic/f06ref/custom/buildinfo/buildinfo.sh  $(shell pwd)/build/tools/
	cp  $(shell pwd)/device/amlogic/f06ref/custom/buildinfo/aml_update_packer  $(shell pwd)/build/tools/releasetools/
	echo "finish copy custom files. please build the project."

endif