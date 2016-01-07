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
	mkdir -p "${D}/usr/$(get_libdir)/erlang/bin/"
	mkdir -p "${D}/usr/$(get_libdir)/erlang/lib/lfe-${PV}"
	mkdir -p "${D}/usr/bin/"

	ERL_LIBS="${D}/usr/$(get_libdir)/erlang/lib/" make install DESTBINDIR="${D}/usr/$(get_libdir)/erlang/bin/"
	export DESTBINDIR="${D}/usr/bin/"

	#Copy it manually.
	cp -r ebin "${D}/usr/$(get_libdir)/erlang/lib/lfe-${PV}/"
	cp -r emacs "${D}/usr/$(get_libdir)/erlang/lib/lfe-${PV}/"

	ln -s "/usr/$(get_libdir)/erlang/bin/lfe" "$DESTBINDIR"
	ln -s "/usr/$(get_libdir)/erlang/bin/lfec" "$DESTBINDIR"
	ln -s "/usr/$(get_libdir)/erlang/bin/lfescript" "$DESTBINDIR"
}
