# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8812AU"
PKG_VERSION="e7a4a390ccbdd768411e1b2a8922c47837f76b47"
PKG_SHA256="66efce15f4220cc6b758666c7150ec0c9761ed3fefd3040462cbfbd36f94fb9e"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/aircrack-ng/rtl8812au"
#PKG_URL="https://github.com/aircrack-ng/rtl8812au/archive/${PKG_VERSION}.tar.gz"
PKG_URL="https://www.dropbox.com/s/c0g7ftg8yim2tb1/8812au-20210629-pete.tar.gz"
PKG_LONGDESC="Realtek RTL8812AU Linux driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=${TARGET_KERNEL_ARCH} \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       CONFIG_POWER_SAVING=n \
        CONFIG_WIFI_MONITOR=y
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    cp *.ko ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
}
