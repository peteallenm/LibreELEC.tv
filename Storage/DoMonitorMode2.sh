#!/bin/bash

WLAN=wlan1

BAND="5G"
#BAND="2G"

CHANNEL2G="6"
CHANNEL5G="36"

#modprobe 88XXau

ifconfig $WLAN down
iw $WLAN set monitor control
#iw reg set BO
ifconfig $WLAN up

case $BAND in
  "5G")
      echo "Setting $WLAN to channel $CHANNEL5G"
      iw dev $WLAN set channel $CHANNEL5G
      ;;
  "2G")
      echo "Setting $WLAN to channel $CHANNEL2G"
      iw dev $WLAN set channel $CHANNEL2G 
      ;;
   *)
      echo "Select 2G or 5G band"
      exit -1;
      ;;
esac
