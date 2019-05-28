# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="A compiz like 3D wayland compositor"
HOMEPAGE="https://github.com/WayfireWM/wayfire"
EGIT_REPO_URI="https://github.com/WayfireWM/wayfire.git"

LICENSE="MIT"
SLOT="0"
IUSE="+elogind systemd"
KEYWORDS=""

DEPEND="
		=gui-libs/wlroots-9999
		media-libs/glm
		x11-libs/gtk+
		x11-libs/cairo
		x11-libs/libxkbcommon
		x11-libs/pixman
		media-libs/libjpeg-turbo
		media-libs/libpng
		elogind? ( >=sys-auth/elogind-239 )
		systemd? ( >=sys-apps/systemd-239 )
		"
RDEPEND="${DEPEND} x11-misc/xkeyboard-config"
BDEPEND="
		virtual/pkgconfig
		>=dev-libs/wayland-protocols-9999
		"


pkg_preinst() {
	if ! use systemd && ! use elogind; then
		fowners root:0 /usr/bin/wayfire
		fperms 4511 /usr/bin/wayfire
	fi
}