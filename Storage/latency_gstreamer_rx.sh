#!/bin/sh

GST_DEBUG_COLOR_MODE=off GST_TRACERS="latency(flags=pipeline+element)" GST_DEBUG=GST_TRACER:7 GST_DEBUG_FILE=traces.log  gst-launch-1.0 -v udpsrc port=5600 ! "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! h264parse ! v4l2slh264dec ! kmssink plane-id=31 plane-properties=s,zpos=3
