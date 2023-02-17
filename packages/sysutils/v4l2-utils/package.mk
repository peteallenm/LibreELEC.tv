# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

# with 1.0.0 repeat delay is broken. test on upgrade

PKG_NAME="v4l2-utils"
PKG_VERSION="1.22.1"
PKG_SHA256="65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31"
PKG_LICENSE="GPL"
PKG_SITE="http://linuxtv.org/"
PKG_URL="http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain alsa-lib elfutils libbpf systemd zlib"
PKG_LONGDESC="Linux V4L2 and DVB API utilities and v4l libraries (libv4l)."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--without-jpeg \
                           --disable-bpf \
                           --disable-doxygen-doc"

pre_configure_target() {
  # cec-ctl fails to build in subdirs
  cd ${PKG_BUILD}
  rm -rf .${TARGET_NAME}
}



make_target() {

  make -C lib LDFLAGS="-D_FILE_OFFSET_BITS=64" CFLAGS="-D_FILE_OFFSET_BITS=64 ${TARGET_CFLAGS} "
  #make -C utils/dvb CFLAGS="-D_FILE_OFFSET_BITS=64 ${TARGET_CFLAGS} "
  #make -C utils/v4l2-ctl CFLAGS="-D_FILE_OFFSET_BITS=64 ${TARGET_CFLAGS} "

  if [ "${LIBREELEC_VERSION}" == "devel" ]; then
    make -C lib LDFLAGS="-D_FILE_OFFSET_BITS=64"  CFLAGS="-D_FILE_OFFSET_BITS=64 ${TARGET_CFLAGS} "
  fi
}

makeinstall_target() {

  # make install DESTDIR=${INSTALL} PREFIX=/usr -C utils/dvb
  # make install DESTDIR=${INSTALL} PREFIX=/usr -C utils/v4l2-ctl

  make install DESTDIR=/build/build.LibreELEC-H2-plus.arm-11.0-devel/toolchain/armv7ve-libreelec-linux-gnueabihf/sysroot/ PREFIX=/usr -C lib
  if [ "${LIBREELEC_VERSION}" == "devel" ]; then
    make install DESTDIR=/build/build.LibreELEC-H2-plus.arm-11.0-devel/toolchain/armv7ve-libreelec-linux-gnueabihf/sysroot/ PREFIX=/usr -C lib
  fi

  #cp ${PKG_BUILD}/contrib/lircd2toml.py ${INSTALL}/usr/bin/
}

post_makeinstall_target() {


  mkdir -p ${INSTALL}/usr/config
    cp -PR ${PKG_DIR}/config/* ${INSTALL}/usr/config

}

makeinstall_host() {

  make install DESTDIR=/build/build.LibreELEC-H2-plus.arm-11.0-devel/toolchain/armv7ve-libreelec-linux-gnueabihf/sysroot/ PREFIX=/usr -C lib
  if [ "${LIBREELEC_VERSION}" == "devel" ]; then
    make install DESTDIR=/build/build.LibreELEC-H2-plus.arm-11.0-devel/toolchain/armv7ve-libreelec-linux-gnueabihf/sysroot PREFIX=/usr -C lib
  fi

}

