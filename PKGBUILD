# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vim-go-tools
pkgver=2020.05.31
pkgrel=1
pkgdesc="Package of tools required by vim-go"
arch=('x86_64')
url="https://github.com/fatih/vim-go"
license=(other)
makedepends=('go')
source=("build.sh" "tools.txt")
sha512sums=('c85e9c08cafb7a800a1eb4a8dc144503d73e00102d40219eaaf9d93f4b18fa5d2e1597722e37e00936d2315dd7f024fa6ac59b9a0f0a173e6e5570f3ef185dd9'
            '85ee72c236e781168153c809dd05003f4b9b4ef8e7e958e302f1f0137bf490b2dbe33159797a8e3afb9dd0565f40619ca03dc25a1139e22c1cf880672420c871')

build() {
	mkdir -p "${srcdir}/go"
	GOPATH="${srcdir}/go" bash "${srcdir}/build.sh"
}

package() {
	for binary in "${srcdir}/go/bin/"*; do
		install -Dm755 "${srcdir}/go/bin/$(basename ${binary})" "${pkgdir}/usr/bin/$(basename ${binary})"
	done
}

pkgver() {
	date +"%Y.%m.%d"
}
