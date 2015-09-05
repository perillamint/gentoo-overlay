# Copyright 1999-2013 Sabayon
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils rpm

BUILD="0-${PV}.b1197.g0a4f7aa"
MY_PN="edk2.git-ovmf-x64"
DESCRIPTION="TianoCore EDK2 OVMF Binary images by Gerd Hoffman"
HOMEPAGE=""
SRC_URI="http://galadriel.gentoo.moe/portage-cdn/edk2-ovmf-bin/${MY_PN}-${BUILD}.noarch.rpm"
LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64"
IUSE="+qemu"

DEPEND="${DEPEND}"
RDEPEND=""

S="${WORKDIR}"
RESTRICT="strip"


src_install() {

	# Removing links of file we don't need, we just want the OVF image
	rm -rfv "${S}"/usr/share/edk2.git/ovmf-x64/*.bin
	rm -rfv "${S}"/usr/share/edk2.git/ovmf-x64/*.rom

	insinto /usr/share
	doins -r "${S}"/usr/share/*

    if use qemu; then
        dosym ../${S}/OVMF.fd /usr/share/qemu/efi-bios.bin
    fi

}
