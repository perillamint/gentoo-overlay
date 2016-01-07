# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit multilib

DESCRIPTION="Lisp-flavoured Erlang"
HOMEPAGE="http://lfe.github.io/"
SRC_URI="https://github.com/lfe/lfe/archive/v${PV}.zip"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/erlang"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i -e 's/ln -s/cp/g' Makefile || die
}

src_install() {
	ERL_LIBS="${D}/usr/$(get_libdir)/erlang/lib/" make install DESTBINDIR="${D}/usr"
	mkdir -p "${D}"/usr/bin
	cp lfe "${D}"/usr/bin
}
