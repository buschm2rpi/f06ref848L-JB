#!/system/bin/sh

echo "do wififix..."
rm  /data/misc/dhcp/dhcpcd-wlan0.lease
rm  /data/misc/dhcp/dhcpcd-wlan0.pid
rm  /data/misc/dhcp/dhcpcd-eth0.lease
rm  /data/misc/dhcp/dhcpcd-eth0.pid

