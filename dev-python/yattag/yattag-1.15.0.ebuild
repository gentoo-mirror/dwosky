# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_10 )
inherit distutils-r1

DESCRIPTION="Python library to generate HTML or XML in a readable, concise and pythonic way. "
HOMEPAGE="https://www.yattag.org/"
SRC_URI="https://github.com/leforestier/yattag/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare
}