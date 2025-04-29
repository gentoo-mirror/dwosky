# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Agent for collecting, processing, aggregating, and writing metrics, logs, and other arbitrary data."
HOMEPAGE="https://influxdata.com/telegraf"
SRC_URI="https://dl.influxdata.com/telegraf/releases/telegraf-${PV}_linux_amd64.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/telegraf-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
  acct-group/telegraf
	acct-user/telegraf
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
  dobin "${S}"/usr/bin/telegraf
  insinto /etc/logrotate.d
  doins "${S}"/etc/logrotate.d/telegraf
  keepdir /etc/telegraf
  newconfd "${FILESDIR}"/telegraf.confd telegraf
  newinitd "${FILESDIR}"/telegraf.rc telegraf
  keepdir /var/log/telegraf
  fowners telegraf:telegraf /var/log/telegraf
}

pkg_config() {
  if [[ ! -f ${ROOT}/etc/telegraf/telegraf.conf ]]; then
    einfo "Creating default configuration file"
    telegraf config > ${ROOT}/etc/telegraf/telegraf.conf
  fi
}
