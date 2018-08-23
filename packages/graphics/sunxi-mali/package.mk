# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="sunxi-mali"
PKG_VERSION="d691cb93884ca8ac67860502117bbec283dc19aa"
PKG_SHA256="72969ecf470b9e5ce787c2f8f36242926e1e892af0891924ee59a2cd206de39f"
PKG_ARCH="arm"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/bootlin/mali-blobs"
PKG_URL="https://github.com/bootlin/mali-blobs/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="mali-blobs-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain libdrm wayland"
PKG_SECTION="graphics"
PKG_SHORTDESC="Sunxi Mali-400 support libraries"
PKG_LONGDESC="Sunxi Mali-400 support libraries"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/include/
    cp -av include/wayland/* $SYSROOT_PREFIX/usr/include

  mkdir -p $SYSROOT_PREFIX/usr/lib/pkgconfig
    cp -PRv $PKG_DIR/pkgconfig/*.pc $SYSROOT_PREFIX/usr/lib/pkgconfig

  MALI="r6p2/arm/wayland/libMali.so"

  mkdir -p $SYSROOT_PREFIX/usr/lib/
    cp -v $MALI $SYSROOT_PREFIX/usr/lib

  mkdir -p $INSTALL/usr/lib
    cp -v $MALI $INSTALL/usr/lib

    for lib in libEGL.so \
               libEGL.so.1 \
               libEGL.so.1.4 \
               libGLESv2.so \
               libGLESv2.so.2 \
               libGLESv2.so.2.0 \
               libgbm.so \
               libgbm.so.1; do
      ln -sfv libMali.so $INSTALL/usr/lib/${lib}
      ln -sfv libMali.so $SYSROOT_PREFIX/usr/lib/${lib}
    done
}
