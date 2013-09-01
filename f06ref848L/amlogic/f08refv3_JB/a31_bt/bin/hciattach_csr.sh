#!/system/bin/sh

/system/bin/bccmd -t bcsp -d /dev/ttyS1 psload -r /system/etc/bluetooth/A31_Script_20110125-rev.psr
sleep 1
/system/bin/hciattach -n /dev/ttyS1 bcsp 921600 flow
