# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vim-go-tools
pkgver=2019.07.11
pkgrel=1
pkgdesc="Package of tools required by vim-go"
arch=('x86_64')
url="https://github.com/fatih/vim-go"
license=(other)
makedepends=('go')
source=("build.sh" "tools.txt")
sha512sums=('ee180fa557e4fe57003a67d4fe19747c6452d5fb39de78265827bfd4baa3aff26ebd8984ebc3cf0d7b22342d66dbd7bccf9d8adecc3498fe0d496376ef5d3e86'
            'db09917d0b8b7947c7e72afd33d8072347a8f445e86c5e18924de04b44ffa98ae3f994cc56378d41f8e03e3ef314032ccd4ab3468df874a694c616cf36f4ddf6')

build() {
	mkdir -p "${srcdir}/go"
	GOPATH="${srcdir}/go" bash "${srcdir}/build.sh"
}

package() {
	for binary in "${srcdir}/go/bin/"*; do
		install -Dm755 "${srcdir}/go/bin/$(basename ${binary})" "${pkgdir}/usr/bin/$(basename ${binary})"
	done
}
