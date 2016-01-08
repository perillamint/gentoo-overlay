# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit multilib

DESCRIPTION="Lisp-flavoured Erlang tools"
HOMEPAGE="http://lfe.github.io/"
SRC_URI="https://github.com/lfex/lfetool/archive/${PV}.zip"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/lfe"
DEPEND="${RDEPEND}"

src_install() {
	mkdir -p "${D}/usr/bin/"

	./lfetool install lfetool "${D}/usr/bin"
	"${D}/usr/bin/lfetool" extract
}
