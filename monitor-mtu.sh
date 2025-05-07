#!/bin/bash

ip monitor link | while read -r line; do
  if [[ "$line" == *"ppp0"* && "$line" == *"mtu"* ]]; then
    echo "MTU change detected on ppp0: $line"
    /data/fix-mtu/fix-mtu.sh 
  fi
done