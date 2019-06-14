# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

# dont update, the old version is intentional
#
PKG_NAME="cryptsetup"
PKG_VERSION="2.0.6"
PKG_SHA256="7c51fae0f0e7ea9af0f515b2ac77009fb2969a6619ebab47d097dca38b083d30"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://gitlab.com/cryptsetup/cryptsetup"
PKG_URL="https://www.kernel.org/pub/linux/utils/cryptsetup/v2.0/cryptsetup-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libgcrypt popt json-c util-linux"
PKG_SECTION="sysutils"
PKG_SHORTDESC="Userspace setup tool for transparent encryption of block devices using dm-crypt"

# at least libdevmapper, but full lvm2 works too
if [ ! -f $(get_build_dir lvm2)/.install_pkg/usr/lib/libdevmapper.so ] ; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libdevmapper"
fi

CRYPTSETUP_CONFIGURE_OPTS="--enable-fips \
                           --disable-veritysetup \
                           --disable-cryptsetup-reencrypt \
                           --disable-integritysetup \
                           --enable-gcrypt-pbkdf2 \
                           --with-sysroot=$SYSROOT_PREFIX \
                           --with-libgcrypt-prefix=$SYSROOT_PREFIX/usr"


PKG_CONFIGURE_OPTS_TARGET="$CRYPTSETUP_CONFIGURE_OPTS"
