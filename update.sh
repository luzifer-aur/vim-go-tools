#!/bin/bash
set -euo pipefail

curl -sSfL "https://raw.githubusercontent.com/fatih/vim-go/master/plugin/go.vim" |
	grep -Eo "\\ \['[^']*/[^']*'" |
	tr -d "[' " |
	sort >tools.txt.new

diff tools.txt tools.txt.new && {
	echo "Up to date"
	rm tools.txt.new
	exit 0
} || true

mv tools.txt.new tools.txt
updpkgsums

sed -i "s/pkgver=.*/pkgver=$(date +%Y.%m.%d)/" PKGBUILD
makepkg --printsrcinfo >.SRCINFO

git add tools.txt .SRCINFO PKGBUILD
git c -m "Update tools $(date +%Y.%m.%d)"