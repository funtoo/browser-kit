# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Proxy for using W3C WebDriver compatible clients to interact with Gecko-based browsers."
HOMEPAGE="https://hg.mozilla.org/mozilla-central/file/tip/testing/geckodriver https://github.com/mozilla/geckodriver"
SRC_URI="https://github.com/mozilla/geckodriver/tarball/53f2b320033668644eae58a8f3af5c94f0efc0f5 -> geckodriver-0.35.0-53f2b32.tar.gz
https://direct.funtoo.org/f9/85/04/f98504403041c7500a49d32214b426b70f6331cbcd785b2297325756378ebafa7266f1c241d0afa00e789804de23bd6ecfb85b8ddba38f032328e2be890564d2 -> geckodriver-0.35.0-funtoo-crates-bundle-ace11cf2bf99ddb2bd864c7b16dcecd482371280c531f2f95bc876e90c100a31af80933984f9542f53ebe7e8f7f6bfadefa46c24eb82f5edad967234fa85f3a8.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mozilla-geckodriver-* ${S} || die
}