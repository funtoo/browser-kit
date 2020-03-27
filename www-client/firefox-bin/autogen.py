#!/usr/bin/env python3

import json

def get_artifact(hub, version, arch):
	if arch == "amd64":
		moz_arch = "x86_64"
	elif arch == "x86":
		moz_arch = "i686"
	url = f"https://archive.mozilla.org/pub/firefox/releases/{version}/linux-{moz_arch}/en-US/firefox-{version}.tar.bz2"
	final_name = f'firefox-bin_{moz_arch}-{version}.tar.bz2'
	return hub.pkgtools.ebuild.Artifact(
		hub,
		url=url,
		final_name=final_name
	)

async def generate(hub, **pkginfo):

	json_data = await hub.pkgtools.fetch.get_page("https://product-details.mozilla.org/1.0/firefox_versions.json")
	json_dict = json.loads(json_data)
	version = json_dict["LATEST_FIREFOX_VERSION"]

	ebuild = hub.pkgtools.ebuild.BreezyBuild(hub,
		**pkginfo,
		version=version,
		artifacts=[
			get_artifact(hub, version, "amd64"),
			get_artifact(hub, version, "x86")
		]
	)
	ebuild.push()

# vim: ts=4 sw=4 noet
