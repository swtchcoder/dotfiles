#!/bin/sh
cd "$(dirname "$0")"

sync_path() {
	src="$1"
	dst="$2"
	echo "$src -> $dst"
	rm -rf "$dst"
	mkdir -p "$(dirname "$dst")"
	cp -a "$src" "$dst"
}

. ./config

find -type f \( -iname "*secret*" -o -iname "*token*" -o -iname "*password*" -o -iname "id_rsa*" -o -iname "id_ed25519*" \) -delete 2>/dev/null

git add .
git commit -m "$(date)" 2>/dev/null
git push origin 2>/dev/null
