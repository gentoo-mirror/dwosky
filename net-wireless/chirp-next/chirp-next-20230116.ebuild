# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_10 )
inherit distutils-r1

DESCRIPTION="Free open-source tool for programming your amateur radio"
HOMEPAGE="http://chirp.danplanet.com"
SRC_URI="https://trac.chirp.danplanet.com/chirp_next/next-${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE="radioreference"
KEYWORDS="~amd64"

DEPEND="${PYTHON_DEPS}
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/requests
	dev-python/six
	dev-python/future
	dev-python/yattag
	dev-libs/libxml2[python]"
RDEPEND="${DEPEND}
	dev-python/wxpython[${PYTHON_USEDEP}]
	radioreference? ( dev-python/suds[${PYTHON_USEDEP}] )"


src_prepare() {
	distutils-r1_src_prepare
}

python_test() {
	pushd tests > /dev/null
	"${PYTHON}" run_tests || die
	popd > /dev/null
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
