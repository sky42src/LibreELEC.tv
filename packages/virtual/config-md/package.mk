# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="config-md"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="linux"
PKG_SECTION="virtual"
PKG_LONGDESC="config-md: Metapackage for kernel option CONFIG_MD to install lvm2, mdadm packages"


# full lvm2 still needs some testing for stuff in /etc/ (probably needs to be moved)
grep -q ^CONFIG_DM_SNAPSHOT= $(get_build_dir linux)/.config && \
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lvm2" || true

# only build mdadm if the kernel supports it
grep -q ^CONFIG_BLK_DEV_MD= $(get_build_dir linux)/.config && \
   PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mdadm" || true
