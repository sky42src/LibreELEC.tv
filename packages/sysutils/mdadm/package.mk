# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mdadm"
PKG_VERSION="4.0"
PKG_SHA256="fa96ed39dd0c3d4451f42678768c07f70bd20670e80e68c60214a147e50a10dd"
PKG_ARCH="any"
PKG_LICENSE="LGPLv2"
PKG_SITE="http://neil.brown.name/blog/mdadm"
PKG_URL="http://www.kernel.org/pub/linux/utils/raid/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain systemd"
PKG_SECTION="system"
PKG_SHORTDESC="mdadm: manager for raid arrays"
PKG_LONGDESC="mdadm is a tool for managing Linux Software RAID arrays."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

STRIP="--strip --strip-program=$STRIP"

PKG_MAKE_OPTS_TARGET="SYSCONFDIR=/storage/.config CC=$CC CWFLAGS="
PKG_MAKEINSTALL_OPTS_TARGET="SYSTEMD_DIR=/usr/lib/systemd/system BINDIR=/usr/sbin install-systemd"
