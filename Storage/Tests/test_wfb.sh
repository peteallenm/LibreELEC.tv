#!/bin/sh

wfb_tx -u 6001 -k 20 -r 10 -p 50 wlan0 & #>/dev/null &
wfb_rx -u 6002 -c 127.0.0.1 -r 10 wlan1 & #>/dev/null &
./wfb_test -s 1200 -i 6002 -p 1000 -o 6001 -t 5 
pkill wfb_tx
pkill wfb_rx


