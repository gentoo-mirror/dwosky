# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Typeface designed for source code"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts/"
SRC_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hack.tar.xz -> ${P}.tar.xz"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="binchecks strip"

FONT_SUFFIX="ttf"
