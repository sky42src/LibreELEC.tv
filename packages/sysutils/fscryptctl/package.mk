# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="fscryptctl"
PKG_VERSION=1.0.0
PKG_SHA256="3828d5ad9b93664b9fec0174fc5d8e96d7b021a7896da74efe18fabe5f01d638"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/google/fscryptctl"
PKG_URL="https://github.com/google/fscryptctl/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="sysutils"
PKG_SHORTDESC="Userspace setup tool for encryption of ext4 filesystems"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/sbin
  cp fscryptctl $INSTALL/usr/sbin
}
