#!/bin/bash
attempt=1
while [ ! -f /sys/class/net/ppp0/mtu ];
do
	echo "ppp0 device not ready - attempt #$attempt"
	(( attempt++ ))
	sleep 15
done
MTU=$(cat /sys/class/net/ppp0/mtu)
echo "MTU for ppp0 on startup is $MTU"
if [ "$MTU" -eq 1492 ]; then
	/data/fix-mtu/fix-mtu.sh 
else
	ip monitor link | while read -r line; do
	  if [[ "$line" == *"ppp0"* && "$line" == *"mtu"* ]]; then
		echo "MTU change detected on ppp0: $line"
		/data/fix-mtu/fix-mtu.sh 
	  fi
	done
fi
