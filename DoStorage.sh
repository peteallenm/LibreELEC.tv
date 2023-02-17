#!/bin/sh

sudo mount /dev/mmcblk0p2 /media/Drive
sudo cp -r Storage/* /media/Drive
mkdir /media/Drive/.config
sudo cp -r Storage/.config/* /media/Drive/.config
sudo umount /media/Drive
