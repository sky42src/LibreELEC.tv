# Made by github.com/escalade and slightly changed by sky42
#
PKG_NAME="cryptsetup"
PKG_VERSION="1.7.5"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://gitlab.com/cryptsetup/cryptsetup"
PKG_URL="https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/cryptsetup-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libgcrypt popt util-linux lvm2-minimal"
PKG_SECTION="sysutils"
PKG_SHORTDESC="Userspace setup tool for transparent encryption of block devices using dm-crypt"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--enable-fips --enable-cryptsetup-reencrypt --enable-gcrypt-pbkdf2 --with-sysroot=$SYSROOT_PREFIX --with-libgcrypt-prefix=$SYSROOT_PREFIX/usr"
