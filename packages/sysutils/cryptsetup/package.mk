# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="cryptsetup"
PKG_VERSION="2.3.7"
PKG_SHA256="61835132a5986217af17b8943013aa3fe6d47bdc1a07386343526765e2ce27a9"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://gitlab.com/cryptsetup/cryptsetup"
PKG_URL="https://www.kernel.org/pub/linux/utils/cryptsetup/v2.3/cryptsetup-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libgcrypt popt json-c util-linux openssl lvm2-lib"
PKG_SECTION="sysutils"
PKG_SHORTDESC="Userspace setup tool for transparent encryption of block devices using dm-crypt"

PKG_CONFIGURE_OPTS_TARGET="--enable-fips \
                           --disable-veritysetup \
                           --disable-cryptsetup-reencrypt \
                           --disable-integritysetup \
                           --enable-gcrypt-pbkdf2 \
                           --with-sysroot=$SYSROOT_PREFIX \
                           --with-libgcrypt-prefix=$SYSROOT_PREFIX/usr"
