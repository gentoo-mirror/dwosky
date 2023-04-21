# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="This library provides a pure Python, asynchronous interface for the Telegram Bot API"
HOMEPAGE="https://docs.python-telegram-bot.org https://github.com/python-telegram-bot/python-telegram-bot"
SRC_URI="https://github.com/python-telegram-bot/python-telegram-bot/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
"
RDEPEND=""
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/flaky[${PYTHON_USEDEP}]
		dev-python/tornado[${PYTHON_USEDEP}]
	)
"

RESTRICT="test"

S="${WORKDIR}/${PN}-${PV}"

distutils_enable_tests pytest

# Run only the tests that don't require a connection
python_test() {
    epytest -m no_req
}

python_prepare_all() {
    distutils-r1_python_prepare_all
}
