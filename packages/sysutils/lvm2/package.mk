# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

# dont update, the old version is intentional
# because of build problems or please fix the build problems
#
PKG_NAME="lvm2"
PKG_VERSION="2.02.177"
PKG_SHA256="4025a23ec9b15c2cb7486d151c29dc953b75efc4d452cfe9dbbc7c0fac8e80f2"
PKG_ARCH="any"
PKG_LICENSE="GPLv2 LGPL2.1"
PKG_SITE="https://sourceware.org/lvm2"
PKG_URL="http://mirrors.kernel.org/sourceware/lvm2/releases/LVM2.$PKG_VERSION.tgz"
PKG_SOURCE_DIR="LVM2.$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain systemd readline util-linux libaio"
PKG_DEPENDS_INIT="toolchain libaio util-linux:init"
PKG_DEPENDS_BOOTSTRAP="toolchain libaio util-linux"
PKG_SECTION="sysutils"
PKG_SHORTDESC="Logical Volume Manager 2 utilities"

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
                           --enable-pkgconfig \
                           --disable-applib \
                           --enable-cmdlib \
                           --enable-udev_sync \
                           --enable-udev_rules \
                           --enable-udev-rule-exec-detection \
                           --enable-lvmetad \
                           --enable-lvmpolld \
                           --enable-dmeventd \
                           --enable-dmfilemapd \
                           --enable-blkdeactivate \
                           --enable-write_install \
                           --with-default-system-dir=/storage/.config/lvm \
                           --with-confdir=/storage/.config \
                           --sysconfdir=/storage/.config \
                           --with-udevdir=/usr/lib/udev/rules.d \
                           --with-systemdsystemunitdir=/usr/lib/systemd/system \
                           --with-tmpfilesdir=/usr/lib/tmpfiles.d"

PKG_CONFIGURE_OPTS_INIT="$LVM2_CONFIG_DEFAULT \
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

PKG_CONFIGURE_OPTS_INIT="$LVM2_CONFIG_INIT"

# attempts to build lvm2:init static
#                         CFLAGS=-I$SYSROOT_PREFIX/usr/include \
#                         CPPFLAGS=-I$SYSROOT_PREFIX/usr/include \
#                         LDFLAGS=-L$SYSROOT_PREFIX/usr/lib \
#                         --enable-static_link \
#                         PKG_CONFIG_PATH=$SYSROOT_PREFIX/usr/lib/pkgconfig \
#                         BLKID_LIBS=-L$SYSROOT_PREFIX/usr/lib \

post_makeinstall_target() {
  # more install targets
  make install_system_dirs DESTDIR=$INSTALL
  # make install_initscripts DESTDIR=$INSTALL
  make install_systemd_units DESTDIR=$INSTALL
  make install_systemd_generators DESTDIR=$INSTALL
  make install_tmpfiles_configuration DESTDIR=$INSTALL

  # detele cache dir
  rm -rf $INSTALL/storage/.config/lvm/cache

  # moving config to the right place
  mkdir -p $INSTALL/usr/config
  mv $INSTALL/storage/.config/lvm $INSTALL/usr/config
  rmdir $INSTALL/storage/.config $INSTALL/storage

  # fix config
  sed -i -e 's|cache_dir = "/etc/lvm/cache"|cache_dir = "/run/lvm"|g' $INSTALL/usr/config/lvm/lvm.conf
  sed -i -e 's|cache_dir = "/storage/.config/lvm/cache"|cache_dir = "/run/lvm"|g' $INSTALL/usr/config/lvm/lvm.conf
  pushd $INSTALL/usr/config/lvm
  for i in `ls -1 lvm*.conf profile/*.profile`; do
    sed -i -e 's|\([" ]\)/etc/lvm\([/ ]\)|\1/storage/.config/lvm\2|g' $i
  done
  popd

  # symlink for config
  mkdir -p $INSTALL/etc
  ln -s /storage/.config/lvm $INSTALL/etc/lvm

  # fix rebuild problem
  chmod u+w $INSTALL/usr/lib/libdevmapper.so*
}

# this is for full lvm2 initramfs support
post_makeinstall_init() {
  # reduce needed binaries
  rm -f $INSTALL/usr/sbin/lvmdump $INSTALL/usr/sbin/lvmconf
  find $INSTALL/usr/sbin -type l | xargs rm

  # reduce config to the minimum
  rm -rf  $INSTALL/etc/lvm/lvmlocal.conf  $INSTALL/etc/lvm/profile

  # fix rebuild problem
  chmod u+w $INSTALL/usr/lib/libdevmapper.so*
}

# very ugly workaround for a bug in lvm2 make install
# that only works if lvm2 is not installed
pre_makeinstall_bootstrap() {
  if [ ! -d /etc/lvm ] ; then
    sudo mkdir /etc/lvm
    sudo chown `whoami`. /etc/lvm
    touch /etc/lvm/.workaround
  fi
}

post_makeinstall_bootstrap() {
  # reduce needed binaries
  rm -f $TOOLCHAIN/sbin/lvmdump $TOOLCHAIN/sbin/lvmconf
  ls -la $TOOLCHAIN/sbin/* | egrep ' lvm$| dmsetup$' | awk '{ print $(NF-2) }' | xargs rm

  # reduce config to the minimum
  rm -rf  $TOOLCHAIN/etc/lvm/lvmlocal.conf  $TOOLCHAIN/etc/lvm/profile

  # fix rebuild problem
  chmod u+w $TOOLCHAIN/lib/libdevmapper.so*

  # remove ugly workaround
  if [ -f /etc/lvm/.workaround ] ; then
    sudo rm -rf /etc/lvm/ || :
  fi
}
