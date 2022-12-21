#!/bin/sh

gst-launch-1.0 -v udpsrc port=5600 ! "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! h264parse ! v4l2slh264dec ! queue max-size-buffers=1 leaky=downstream ! kmssink sync=0 plane-id=31 plane-properties=s,zpos=3
