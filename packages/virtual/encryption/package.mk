# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="encryption"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="linux:host"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="virtual"
PKG_LONGDESC="encryption: Metapackage for cryptsetup, fscryptctl packages"


# only build cryptsetup if the kernel supports it
grep -q ^CONFIG_DM_CRYPT= $(get_build_dir linux)/.config && \
    PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET cryptsetup" || :

# only build fscryptctl if the kernel supports it
grep -q ^CONFIG_EXT4_ENCRYPTION= $(get_build_dir linux)/.config && \
    PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET fscryptctl" || :
# kernel 5.1 no explicit option for ext4
grep -q ^CONFIG_FS_ENCRYPTION= $(get_build_dir linux)/.config && \
    PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET fscryptctl" || :
