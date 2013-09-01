#!/system/bin/sh
random()
{
  echo `expr $RANDOM % 256`
}
addr()
{
  printf "00%02x %02x%02x 00%02x %02x%02x\n" `random` `random` `random` `random` `random` `random`
}
if [ -f "/system/etc/bluetooth/A31_Script_20110125-rev.psr" ];then
	sed -i "s/0001 = 0000 0000 0000 0000/0001 = `addr`/g" /system/etc/bluetooth/A31_Script_20110125-rev.psr 
fi

