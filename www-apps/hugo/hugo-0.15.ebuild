# Copyright 2014-2015 Jonathan Vasquez <jvasquez1011@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit user systemd

GITHUB_USER="spf13"
GITHUB_REPO="hugo"
GITHUB_TAG="${PV}"

NAME="hugo"
DESCRIPTION="Hugo, a fast and flexible static site generator."
HOMEPAGE="https://gohugo.io/"

SRC_URI="
	amd64? ( https://github.com/${GITHUB_USER}/${GITHUB_REPO}/archive/v${GITHUB_TAG}.tar.gz -> ${P}.tar.gz )"

RESTRICT="mirror"
LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-lang/go-1.4.0"

S="${WORKDIR}"

src_install() {
	# Create directory structure recommended by Hugo Documentation
	# Since Go is "very particular" about file locations.
	local newBaseDir="src/github.com/${GITHUB_USER}"
	local newWorkDir="${newBaseDir}/${PN}"

	mkdir -p "${newBaseDir}"
	mv "${P}" "${newWorkDir}"

	cd "${newWorkDir}"

	# Build hugo.
	go get
	go build -o hugo main.go

	# Copy compiled binary over to image directory
	dobin "${PN}"
}
