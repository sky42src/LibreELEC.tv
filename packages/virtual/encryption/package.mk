# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="encryption"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_SECTION="virtual"
PKG_LONGDESC="encryption: Metapackage to conditional build cryptsetup, fscryptctl packages depending on kernel support"

PKG_KERNEL_CFG_FILE=$(kernel_config_path) || die

# only build cryptsetup if the kernel supports it
grep -q ^CONFIG_DM_CRYPT= "${PKG_KERNEL_CFG_FILE}" \
  && PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET cryptsetup" || :

# only build fscryptctl if the kernel supports it
grep -q ^CONFIG_FS_ENCRYPTION= "${PKG_KERNEL_CFG_FILE}" \
  && PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET fscryptctl" || :
