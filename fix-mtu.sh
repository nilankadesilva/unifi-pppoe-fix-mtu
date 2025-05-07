#!/bin/bash
IFACE=eth6
VLAN=35
MTUPATH=/sys/class/net/ppp0/mtu
MTU=$(cat /sys/class/net/ppp0/mtu)
if ! [ -f $MTUPATH ]; then 
  echo "PPP0 device not ready"
  exit 0
fi
if [ "$MTU" -eq 1492 ]; then
  echo "MTU for ppp0 is $MTU, changing to 1500"
  sed -i 's/ 1492/ 1500/g' /etc/ppp/peers/ppp0
  ip link set dev ${IFACE} mtu 1508
  ip link set dev ${IFACE}.${VLAN} mtu 1508
  ifconfig ${IFACE} down
  ifconfig ${IFACE} up
  killall pppd
  sleep 1
  killall -HUP dnscrypt-proxy dnsmasq
else
  echo "MTU is OK"
fi