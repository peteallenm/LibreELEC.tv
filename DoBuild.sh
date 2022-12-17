#!/bin/sh

sudo echo "Get sudo ready for later"
rm target/*
docker run --rm --log-driver none -v `pwd`:/build -w /build -it -e PROJECT=Allwinner -e ARCH=arm -e DEVICE=H3 -e UBOOT_SYSTEM=orangepi-pc -e MTDEBUG=yes -e MTVERBOSE=yes -e MTDEBUG=yes libreelec make  image
gunzip -c target/*.img.gz | sudo dd of=/dev/mmcblk0 bs=1M
sudo ./DoStorage.sh
