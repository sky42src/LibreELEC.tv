# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="config-md"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_SECTION="virtual"
PKG_LONGDESC="config-md: Metapackage to conditional build lvm2, mdadm packages depending on kernel support for Multiple devices"

PKG_KERNEL_CFG_FILE=$(kernel_config_path) || die

# only build lvm2 if the kernel supports device mapper
grep -q ^CONFIG_BLK_DEV_DM= "${PKG_KERNEL_CFG_FILE}" \
  && PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lvm2" || :

# only build mdadm if the kernel supports md devices
grep -q ^CONFIG_BLK_DEV_MD= "${PKG_KERNEL_CFG_FILE}" \
  && PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mdadm" || :
