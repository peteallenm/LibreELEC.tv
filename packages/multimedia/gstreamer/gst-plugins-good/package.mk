# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gst-plugins-good"
PKG_VERSION="1.21.1"
PKG_SHA256="959011ffaea7d4cd4e5433e408544466b4a1ea09676e6bc64f8d36efb01f5605"
PKG_LICENSE="GPL-2.1-or-later"
PKG_SITE="https://gstreamer.freedesktop.org/modules/gst-plugins-good.html"
PKG_URL="https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.21.1.tar.xz"
PKG_DEPENDS_TARGET="toolchain gstreamer gst-plugins-base"
PKG_LONGDESC="Base GStreamer plugins and helper libraries"
#PKG_BUILD_FLAGS="-gold"

pre_configure_target() {
  PKG_MESON_OPTS_TARGET="-Dadaptivedemux2=disabled \
                        -Daalib=disabled \
                        -Dbz2=disabled \
                        -Dcairo=disabled \
                        -Ddirectsound=disabled \
                        -Ddv=disabled \
                        -Ddv1394=disabled \
                        -Dflac=disabled \
                        -Dgdk-pixbuf=disabled \
                        -Dgtk3=disabled \
                        -Djack=disabled \
                        -Djpeg=disabled \
                        -Dlame=disabled \
                        -Dlibcaca=disabled \
                        -Dmpg123=disabled \
                        -Doss=disabled \
                        -Doss4=disabled \
                        -Dosxaudio=disabled \
                        -Dosxvideo=disabled \
                        -Dpng=disabled \
                        -Dpulse=disabled \
                        -Dqt5=disabled \
                        -Dshout2=disabled \
                        -Dsoup=disabled \
                        -Dspeex=disabled \
                        -Dtaglib=disabled \
                        -Dtwolame=disabled \
                        -Dvpx=disabled \
                        -Dwaveform=disabled \
                        -Dwavpack=disabled \
                         -Dexamples=disabled \
                         -Dtests=disabled \
                         -Dnls=disabled \
                         -Dorc=disabled \
                         -Dgobject-cast-checks=disabled \
                         -Dglib-asserts=disabled \
                         -Dglib-checks=disabled \
                         -Dpackage-name=gst-plugins-base \
                         -Dpackage-origin=LibreELEC.tv \
                         -Ddoc=disabled"
}
