PKG_NAME="wifibroadcast"
PKG_VERSION="1"
PKG_SHA256="82d7c2f4ad6a22f9b94fd2355a6006b879f547c8ba7576f7b153ba0dff820aa4"
PKG_SITE="https://github.com/OpenHD/Open.HD"
PKG_URL="https://www.dropbox.com/s/03dxki9abv3rc6j/wifibroadcast_1.0.tgz"
#PKG_URL="https://github.com/svpcom/wfb-ng/archive/refs/heads/master.zip"
PKG_DEPENDS_TARGET="toolchain libpcap libsodium spdlog"
#PKG_DEPENDS_TARGET="toolchain libpcap libsodium"
PKG_TOOLCHAIN="make"

makeinstall_target() {
   mkdir -p ${INSTALL}/usr/bin
  cp wfb_tx ${INSTALL}/usr/bin
  cp wfb_rx ${INSTALL}/usr/bin
  cp wfb_keygen ${INSTALL}/usr/bin
}
