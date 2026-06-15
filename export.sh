#!/bin/sh
cd "$(dirname "$0")"

sync_path() {
	src="$1"
	dst="$2"
	rm -rf "$2"
	mkdir -p "$(dirname "$2")"
	cp -a "$1" "$2"
}

. ./config

find -type f \( -iname "*secret*" -o -iname "*token*" -o -iname "*password*" -o -iname "id_rsa*" -o -iname "id_ed25519*" \) -delete 2>/dev/null

git add .
git commit -m "$(date)"
git push origin 2>/dev/null
