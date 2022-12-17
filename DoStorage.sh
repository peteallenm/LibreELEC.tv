#!/bin/sh

sudo mount /dev/mmcblk0p2 /media/Drive
sudo cp -r Storage/* /media/Drive
sudo umount /media/Drive
