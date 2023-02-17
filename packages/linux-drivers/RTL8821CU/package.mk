# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8821CU"
PKG_VERSION="1"
PKG_SHA256="a40e2c458325254ab76fe38d07d8b6a67d43edaeba98c393e608a408e6958457"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/brektrou/rtl8821CU"
#PKG_URL="https://github.com/aircrack-ng/rtl8812au/archive/${PKG_VERSION}.tar.gz"
PKG_URL="https://www.dropbox.com/s/145o7p7jxr10ewi/8821cu-pete.tar.gz"
PKG_LONGDESC="Realtek RTL8821CU Linux driver"
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
