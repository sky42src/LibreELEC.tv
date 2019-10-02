# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="gzip"
PKG_VERSION="1.10"
PKG_SHA256="c91f74430bf7bc20402e1f657d0b252cb80aa66ba333a25704512af346633c68"
PKG_LICENSE="GPL3"
PKG_SITE="https://www.gnu.org/software/gzip"
PKG_URL="http://ftpmirror.gnu.org/gzip/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_INIT="toolchain gzip"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="GNU Gzip is a popular data compression program originally written by Jean-loup Gailly for the GNU project."

configure_init() {
  : # reuse configure_target()
}

make_init() {
  : # reuse make_target()
}

makeinstall_init() {
  mkdir -p $INSTALL/usr/bin
    cp -prv ../.install_pkg/usr/bin $INSTALL/usr

}

post_makeinstall_target() {
  mv ${INSTALL}/usr/bin ${INSTALL}/usr/tmp
  mkdir -p ${INSTALL}/usr/bin
  for file in gzip gunzip; do
    mv ${INSTALL}/usr/tmp/${file} ${INSTALL}/usr/bin
  done
  rm -fr ${INSTALL}/usr/tmp
  rm -fr ${INSTALL}/usr/share
}
