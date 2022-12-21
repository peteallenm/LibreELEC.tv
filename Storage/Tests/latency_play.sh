#!/bin/sh

GST_DEBUG_COLOR_MODE=off GST_TRACERS="latency(flags=pipeline+element)" GST_DEBUG=GST_TRACER:7 GST_DEBUG_FILE=traces_h265file_25mb.log gst-launch-1.0 -v filesrc location=Video265_25mb.mkv ! matroskademux ! h265parse ! v4l2slh265dec ! fakesink
#GST_DEBUG_COLOR_MODE=off GST_TRACERS="latency(flags=pipeline+element)" GST_DEBUG=GST_TRACER:7 GST_DEBUG_FILE=traces_h264file.log gst-launch-1.0 -v filesrc location=Video264.mkv ! matroskademux ! h264parse ! v4l2slh264dec ! fakesink
#GST_DEBUG_COLOR_MODE=off GST_TRACERS="latency(flags=pipeline+element)" GST_DEBUG=GST_TRACER:7 GST_DEBUG_FILE=traces_h264file_kms.log gst-launch-1.0 -v filesrc location=Video264.mkv ! matroskademux ! h264parse ! v4l2slh264dec ! kmssink plane-id=31 plane-properties=s,zpos=3
# kmssink plane-id=31
# GST_DEBUG_COLOR_MODE=off GST_TRACERS="latency(flags=pipeline+element)" GST_DEBUG=GST_TRACER:7 GST_DEBUG_FILE=traces_h264file_h3.log gst-launch-1.0 -v filesrc location=cedar2.mkv ! matroskademux ! h264parse ! v4l2slh264dec ! fakesink