#
PKG_NAME="lvm2-minimal"
PKG_VERSION="2.02.173"
PKG_ARCH="any"
PKG_LICENSE="GPLv2 LGPL2.1"
PKG_SITE="https://sourceware.org/lvm2"
PKG_URL="http://mirrors.kernel.org/sourceware/lvm2/releases/LVM2.$PKG_VERSION.tgz"
PKG_SOURCE_DIR="LVM2.$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain systemd readline util-linux"
PKG_SECTION="sysutils"
PKG_SHORTDESC="Logical Volume Manager 2 utilities"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_malloc_0_nonnull=yes \
			   ac_cv_func_realloc_0_nonnull=yes \
			   --enable-pkgconfig \
			   --enable-cmdlib \
			   --enable-applib"

post_makeinstall_target() {
  # for a full lvm2 package just dont delete anything
  rm -rf $INSTALL/etc
  rm -f $INSTALL/usr/sbin/lv*
  rm -f $INSTALL/usr/sbin/pv*
  rm -f $INSTALL/usr/sbin/vg*
  rm -f $INSTALL/usr/lib/liblvm2app*
}
