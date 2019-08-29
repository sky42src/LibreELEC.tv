# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

# dont update, the old version is intentional
# because of build problems or please fix the build problems
#
PKG_NAME="libdevmapper"
PKG_VERSION="2.02.177"
PKG_SHA256="4025a23ec9b15c2cb7486d151c29dc953b75efc4d452cfe9dbbc7c0fac8e80f2"
PKG_ARCH="any"
PKG_LICENSE="GPLv2 LGPL2.1"
PKG_SITE="https://sourceware.org/lvm2"
PKG_URL="http://mirrors.kernel.org/sourceware/lvm2/releases/LVM2.$PKG_VERSION.tgz"
PKG_SOURCE_DIR="LVM2.$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libaio util-linux"
PKG_SECTION="sysutils"
PKG_SHORTDESC="Logical Volume Manager 2 libdevmapper"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

LVM2_CONFIG_DEFAULT="ac_cv_func_malloc_0_nonnull=yes \
                     ac_cv_func_realloc_0_nonnull=yes \
                     --disable-use-lvmlockd \
                     --disable-selinux \
                     --disable-dbus-service \
                     --with-cache=none \
                     --with-thin=none \
                     --with-clvmd=none \
                     --with-cluster=none"

PKG_CONFIGURE_OPTS_TARGET="$LVM2_CONFIG_DEFAULT \
                         --with-optimisation=-Os \
                         --disable-readline \
                         --disable-applib \
                         --disable-cmdlib \
                         --disable-blkid_wiping \
                         --disable-use-lvmetad \
                         --with-mirrors=none \
                         --disable-use-lvmpolld \
                         --disable-dmeventd \
                         --disable-dmfilemapd \
                         --disable-blkdeactivate \
                         --disable-udev_sync \
                         --disable-udev_rules \
                         --disable-pkgconfig \
                         --disable-fsadm \
                         --disable-nls"

# we want just libdevmapper
post_makeinstall_target() {

  # only libdevmapper
  find $INSTALL -type f -o -type l | grep -v 'libdevmapper\.' | xargs rm

  # fix rebuild problem
  chmod u+w $INSTALL/usr/lib/libdevmapper.so*

}
