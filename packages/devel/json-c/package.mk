# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="json-c"
PKG_VERSION="0.13.1-20180305"
PKG_SHA256="5d867baeb7f540abe8f3265ac18ed7a24f91fe3c5f4fd99ac3caba0708511b90"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/json-c/json-c"
PKG_URL="https://github.com/json-c/json-c/archive/json-c-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="JSON-C - A JSON implementation in C"

pre_configure_target() {
  pushd ..
  ./autogen.sh
  popd
}
