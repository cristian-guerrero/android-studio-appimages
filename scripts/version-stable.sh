#!/bin/bash

set -eu

data=$(curl --fail -s https://developer.android.com/studio)
data=$(echo "${data}" | awk '/data-category="studio_linux_bundle_download"/,/id="agree-button__studio_linux_bundle_download"/ { print }')
version=$(echo "${data}" | sed -nr 's/.*\/ide-zips\/(.*?)\/.*/\1/p')
url=$(echo "${data}" | grep -oE 'https://[^"<> ]+linux\.tar\.gz' | head -1)

echo "${version}"
echo "${url}"
