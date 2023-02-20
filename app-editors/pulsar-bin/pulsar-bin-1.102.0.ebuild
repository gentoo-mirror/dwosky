# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop unpacker xdg-utils

DESCRIPTION="A Community-led Hyper-Hackable Text Editor"
HOMEPAGE="https://pulsar-edit.dev/"
SRC_URI="https://github.com/pulsar-edit/pulsar/releases/download/v${PV}/Linux.${PV}.deb -> ${P}.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_unpack() {
  unpack_deb ${P}.deb
}

src_install() {
  mv "${S}/usr/share/doc/pulsar" "${S}/usr/share/doc/${PF}"
  rm "${S}/usr/share/applications"
  cp -a "${S}/usr" "${D}/"
  cp -a "${S}/opt" "${D}/"
  make_desktop_entry '/opt/Pulsar/pulsar --no-sandbox' Pulsar pulsar "Development"
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
