#!/bin/sh

gst-launch-1.0 -v udpsrc port=5600 ! "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! h264parse ! v4l2slh264dec ! sync=0 kmssink plane-id=31 plane-properties=s,zpos=3
