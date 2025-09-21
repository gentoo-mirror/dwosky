# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
EPYTHON=python3.13
inherit distutils-r1 xdg-utils desktop

DESCRIPTION="Free open-source tool for programming your amateur radio"
HOMEPAGE="https://chirpmyradio.com"
SRC_URI="https://archive.chirpmyradio.com/chirp_next/next-${PV}/chirp-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/chirp-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/lark[${PYTHON_USEDEP}]
	dev-python/yattag[${PYTHON_USEDEP}]
	dev-python/wxpython[${PYTHON_USEDEP}]
	dev-python/suds-community[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/autopep8[${PYTHON_USEDEP}]
		dev-python/ddt[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-python/pytest-httpserver[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	distutils-r1_src_prepare
}

python_install() {
	distutils-r1_python_install
	domenu "${S}/chirp/share/chirp.desktop"
	local i
	for i in 16x16 22x22 32x32 48x48 64x64 128x128; do
		doicon -s ${i} "${S}/chirp/share/chirp.png"
	done
}

distutils_enable_tests pytest

python_test() {
	epytest
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
