# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit toolchain-funcs
inherit git-2

DESCRIPTION="Steam protocol plugin for pidgin"
HOMEPAGE="https://github.com/eionrobb/pidgin-opensteamworks"
EGIT_REPO_URI="https://github.com/EionRobb/pidgin-opensteamworks.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="**"
IUSE=""

RDEPEND="dev-libs/glib:2
	dev-libs/json-glib
	dev-libs/nss
	gnome-base/libgnome-keyring
	net-im/pidgin"
DEPEND="${RDEPEND}
	app-arch/unzip
	virtual/pkgconfig"

S=${WORKDIR}

pkg_setup() {
	if [[ ${MERGE_TYPE} != binary ]]; then
		tc-export CC PKG_CONFIG
	fi
}

#src_prepare() {
	# see https://code.google.com/p/pidgin-opensteamworks/issues/detail?id=31
	#cp "${FILESDIR}"/${PN}-1.3-Makefile "${S}"/${P}/steam-mobile/Makefile || die
	#unzip "${S}"/${P}/steam-mobile/releases/icons.zip || die
#}

src_compile() {
	pushd steam-mobile || die
	default
	popd || die
}

src_install() {
	pushd steam-mobile || die
	default
	popd || die
	insinto /usr/share/pixmaps/pidgin/protocols
	#doins -r "${WORKDIR}"/steam-mobile/{16,48}
	dodoc ${WORKDIR}/README.md
}
