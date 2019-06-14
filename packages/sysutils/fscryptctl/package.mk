# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="fscryptctl"
PKG_VERSION="142326810eb19d6794793db6d24d0775a15aa8e5"
PKG_SHA256="ae148ad0bc6565d1d5102f20fe9176cfb12fa1fc8b2d02e27aa146f21a9c7d4f"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/google/fscryptctl"
PKG_URL="https://github.com/google/fscryptctl/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="sysutils"
PKG_SHORTDESC="Userspace setup tool for encryption of ext4 filesystems"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/sbin
  cp fscryptctl $INSTALL/usr/sbin
}
