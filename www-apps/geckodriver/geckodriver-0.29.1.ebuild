# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
adler-1.0.2
aho-corasick-0.7.18
autocfg-1.0.1
base64-0.10.1
base64-0.12.3
base64-0.13.0
bitflags-1.3.2
block-buffer-0.9.0
byteorder-1.4.3
bytes-0.5.6
bytes-1.1.0
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.19
clap-2.33.3
cookie-0.12.0
cpufeatures-0.2.1
crc32fast-1.2.1
digest-0.9.0
dirs-2.0.2
dirs-sys-0.3.6
dtoa-0.4.8
flate2-1.0.20
fnv-1.0.7
form_urlencoded-1.0.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.3.16
futures-channel-0.3.16
futures-core-0.3.16
futures-io-0.3.16
futures-sink-0.3.16
futures-task-0.3.16
futures-util-0.3.16
generic-array-0.14.4
getrandom-0.2.3
h2-0.2.7
hashbrown-0.11.2
headers-0.3.4
headers-core-0.2.0
http-0.2.4
http-body-0.3.1
httparse-1.5.1
httpdate-0.3.2
hyper-0.13.10
idna-0.2.3
indexmap-1.7.0
iovec-0.1.4
itoa-0.4.8
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.101
line-wrap-0.1.1
linked-hash-map-0.5.4
log-0.4.14
matches-0.1.9
memchr-2.4.1
mime-0.3.16
mime_guess-2.0.3
miniz_oxide-0.4.4
mio-0.6.23
miow-0.2.2
mozdevice-0.3.2
mozprofile-0.7.2
mozrunner-0.12.1
mozversion-0.4.1
msdos_time-0.1.6
net2-0.2.37
num-integer-0.1.44
num-traits-0.2.14
once_cell-1.8.0
opaque-debug-0.3.0
percent-encoding-2.1.0
pin-project-0.4.28
pin-project-1.0.8
pin-project-internal-0.4.28
pin-project-internal-1.0.8
pin-project-lite-0.1.12
pin-project-lite-0.2.7
pin-utils-0.1.0
plist-0.5.5
podio-0.1.7
ppv-lite86-0.2.10
proc-macro2-1.0.28
quote-1.0.9
rand-0.8.4
rand_chacha-0.3.1
rand_core-0.6.3
rand_hc-0.3.1
redox_syscall-0.2.10
redox_users-0.4.0
regex-1.5.4
regex-syntax-0.6.25
remove_dir_all-0.5.3
rust-ini-0.10.3
ryu-1.0.5
safemem-0.3.3
same-file-1.0.6
scoped-tls-1.0.0
semver-0.9.0
semver-parser-0.7.0
serde-1.0.129
serde_derive-1.0.129
serde_json-1.0.66
serde_repr-0.1.7
serde_urlencoded-0.6.1
serde_yaml-0.8.20
sha-1-0.9.8
slab-0.4.4
socket2-0.3.19
strsim-0.8.0
syn-1.0.75
tempfile-3.2.0
term_size-0.3.2
textwrap-0.11.0
time-0.1.43
tinyvec-1.3.1
tinyvec_macros-0.1.0
tokio-0.2.25
tokio-util-0.3.1
tower-service-0.3.1
tracing-0.1.26
tracing-core-0.1.19
tracing-futures-0.2.5
try-lock-0.2.3
typenum-1.13.0
unicase-2.6.0
unicode-bidi-0.3.6
unicode-normalization-0.1.19
unicode-segmentation-1.8.0
unicode-width-0.1.8
unicode-xid-0.2.2
url-2.2.2
urlencoding-1.3.3
uuid-0.8.2
version_check-0.9.3
walkdir-2.3.2
want-0.3.0
warp-0.2.5
wasi-0.10.2+wasi-snapshot-preview1
webdriver-0.43.1
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.5.1
ws2_32-sys-0.2.1
xml-rs-0.8.4
yaml-rust-0.4.5
zip-0.4.2
"

inherit cargo

DESCRIPTION="Proxy for using WebDriver clients to interact with Gecko-based browsers."
HOMEPAGE="https://hg.mozilla.org/mozilla-central/file/tip/testing/geckodriver"
SRC_URI="https://api.github.com/repos/mozilla/geckodriver/tarball/v0.29.1 -> geckodriver-0.29.1.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="*"

DOCS=(
	"README.md"
	"CHANGES.md"
	"CONTRIBUTING.md"
	"doc/TraceLogs.md"
)

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/mozilla-geckodriver-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}