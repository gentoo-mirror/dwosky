# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop unpacker xdg-utils

DESCRIPTION="Java Rom Manager"
HOMEPAGE="https://github.com/optyfr/JRomManager"
SRC_URI="https://github.com/optyfr/JRomManager/releases/download/${PV}/JRomManager-${PV}.zip -> ${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

MY_PN="${PN/-bin/}"
DESTDIR="/opt/JRomManager"
S="${WORKDIR}/${MY_PN^}"

src_unpack() {
  unpack_zip ${P}.zip
}

src_install() {
  doicon -s 256 "rom.png"
  make_desktop_entry "java -jar ${DESTDIR}/JRomManager.jar" JRomManager rom "Games"
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
