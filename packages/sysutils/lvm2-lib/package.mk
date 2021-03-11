# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

#
# this package is only needed to build cryptsetup as a dependency of systemd
# full lvm2 needs systemd as a dependency and that would be a circle
#

PKG_NAME="lvm2-lib"
PKG_VERSION="2.03.10"
PKG_SHA256="5ad1645a480440892e35f31616682acba0dc204ed049635d2df3e5a5929d0ed0"
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
