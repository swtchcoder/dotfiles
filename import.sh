#!/bin/sh
cd "$(dirname "$0")"

sync_path() {
	rm -rf "$1"
	mkdir -p "$(dirname "$1")"
	cp -a "$2" "$1"
	echo "$2 -> $1"
}

. ./config
