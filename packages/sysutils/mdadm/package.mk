# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mdadm"
PKG_VERSION="4.2"
PKG_SHA256="c83447797cccc772d1c389b1917a2bfda59bd7545480bdccd792b57b310b428e"
PKG_ARCH="any"
PKG_LICENSE="LGPLv2"
PKG_SITE="https://raid.wiki.kernel.org/index.php/Linux_Raid"
PKG_URL="http://www.kernel.org/pub/linux/utils/raid/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain systemd"
PKG_SECTION="system"
PKG_SHORTDESC="mdadm: manager for raid arrays"
PKG_LONGDESC="mdadm is a tool for managing Linux Software RAID arrays."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_MAKE_OPTS_TARGET="SYSCONFDIR=/storage/.config CC=$CC CWFLAGS= STRIP="
PKG_MAKEINSTALL_OPTS_TARGET="SYSTEMD_DIR=/usr/lib/systemd/system STRIP= BINDIR=/usr/sbin install-systemd"
