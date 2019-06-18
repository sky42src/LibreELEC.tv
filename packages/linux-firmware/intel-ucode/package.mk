# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="intel-ucode"
PKG_VERSION="20190514"
PKG_SHA256="553858de4315d267d1f259d1146db028eec5112a797379a7a83f5c8a22e626b3"
PKG_ARCH="x86_64"
PKG_LICENSE="other"
PKG_SITE="https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files"
PKG_URL="https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/archive/microcode-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain intel-ucode:host"
PKG_LONGDESC="intel-ucode: Intel CPU microcodes"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  mkdir -p $PKG_BUILD
  tar xf $SOURCES/$PKG_NAME/intel-ucode-${PKG_VERSION}.tar.gz -C $PKG_BUILD
  mv $PKG_BUILD/Intel-Linux-Processor-Microcode-Data-Files-microcode-${PKG_VERSION}/* $PKG_BUILD/
  rmdir $PKG_BUILD/Intel-Linux-Processor-Microcode-Data-Files-microcode-${PKG_VERSION}/
}

make_host() {
  :
}
makeinstall_host() {
  :
}
