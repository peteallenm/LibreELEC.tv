PKG_NAME="openhd"
PKG_VERSION="1"
PKG_SHA256="74c9f71a71871d42763e4780d24270ad48123d37e5b8a10ed9ac8d3356afed70"
PKG_SITE="https://github.com/OpenHD/Open.HD"
PKG_URL="https://www.dropbox.com/s/n3nvg1ddfmqnugt/openhd_1.0.tgz"
PKG_DEPENDS_TARGET="toolchain libpcap libsodium spdlog boost  v4l2-utils"
#PKG_DEPENDS_TARGET="toolchain libpcap libsodium"
 
#PKG_SOURCE_DIR="OpenHD-allwinner_enc"
#PKG_TOOLCHAIN="cmake"
#PKG_CMAKE_SCRIPT="/build/build.LibreELEC-H2-plus.arm-11.0-devel/build/openhd-1/OpenHD/CMakeLists.txt"

PKG_CMAKE_OPTS_TARGET="-DCMAKE_PREFIX_PATH=/build/build.LibreELEC-H2-plus.arm-11.0-devel/toolchain/include;build.LibreELEC-H2-plus.arm-11.0-devel/toolchain/lib "

makeinstall_target() {

  # make install DESTDIR=${INSTALL} PREFIX=/usr -C utils/dvb
  # make install DESTDIR=${INSTALL} PREFIX=/usr -C utils/v4l2-ctl

  cp ${PKG_BUILD}/.armv7ve-libreelec-linux-gnueabihf/openhd /build/build.LibreELEC-H2-plus.arm-11.0-devel/image/system/usr/bin/
  cp ${PKG_BUILD}/.armv7ve-libreelec-linux-gnueabihf/openhd /build/build.LibreELEC-H2-plus.arm-11.0-devel/toolchain/armv7ve-libreelec-linux-gnueabihf/sysroot/usr/bin/
cp /build/build.LibreELEC-H2-plus.arm-11.0-devel/toolchain/armv7ve-libreelec-linux-gnueabihf/sysroot/usr/lib/libboost* /build/build.LibreELEC-H2-plus.arm-11.0-devel/image/system/usr/lib
cp -r /build/build.LibreELEC-H2-plus.arm-11.0-devel/toolchain/armv7ve-libreelec-linux-gnueabihf/sysroot/usr/lib/libv4l* /build/build.LibreELEC-H2-plus.arm-11.0-devel/image/system/usr/lib
}