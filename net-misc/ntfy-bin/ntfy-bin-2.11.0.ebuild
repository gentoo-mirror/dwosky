# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Send push notifications to your phone or desktop using PUT/POST"
HOMEPAGE="https://ntfy.sh/"
SRC_URI="https://github.com/binwiederhier/ntfy/releases/download/v${PV}/ntfy_${PV}_linux_amd64.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/ntfy_${PV}_linux_amd64"


LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
  acct-group/ntfy
	acct-user/ntfy
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
  dodir /etc/ntfy
  mv "${S}"/client/client.yml "${ED}"/etc/ntfy
  mv "${S}"/server/server.yml "${ED}"/etc/ntfy
  dobin "${S}"/ntfy
  newconfd "${FILESDIR}"/ntfy.confd ntfy
	newinitd "${FILESDIR}"/ntfy.initd ntfy
}
