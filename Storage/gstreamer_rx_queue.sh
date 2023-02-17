#!/bin/sh
number=0

fname=OpenHD.mkv

while [ -e "/storage/$fname" ]; do
    number=$(( ++number ))
    fname=OpenHD-$number.mkv
done

printf 'Will use "%s" as filename\n' "/storage/$fname"
echo "should be using /storage/$fname as filename for gstreamer output" >/storage/GStreamerFile.txt
gst-launch-1.0 -v udpsrc port=5600 ! "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! h264parse ! tee name=t \
    t. ! v4l2slh264dec ! queue max-size-buffers=1 leaky=downstream ! kmssink sync=0 plane-id=31 plane-properties=s,zpos=3 \
    t. ! queue ! matroskamux ! filesink location="/storage/$fname" >& /storage/GStreamerLog.txt

