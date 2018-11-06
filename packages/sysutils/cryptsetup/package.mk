# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

# dont update the version, the old version is intentional
#
PKG_NAME="cryptsetup"
PKG_VERSION="1.7.5"
PKG_SHA256="2b30cd1d0dd606a53ac77b406e1d37798d4b0762fa89de6ea546201906a251bd"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://gitlab.com/cryptsetup/cryptsetup"
PKG_URL="https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/cryptsetup-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libgcrypt popt util-linux"
PKG_SECTION="sysutils"
PKG_SHORTDESC="Userspace setup tool for transparent encryption of block devices using dm-crypt"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--enable-fips --enable-gcrypt-pbkdf2 --with-sysroot=$SYSROOT_PREFIX --with-libgcrypt-prefix=$SYSROOT_PREFIX/usr"


if [ -f $(get_build_dir lvm2)/.install_pkg/usr/lib/libdevmapper.so ] ; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lvm2"
else
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lvm2-minimal"
fi
