#!/bin/sh
MAX=5

cd "$DOTFILES"

sync_path() {
	src="$1"
	dst="$2"
	echo "$src -> $dst"
	#rm -rf "$dst"
	#mkdir -p "$(dirname "$dst")"
	#cp -a "$src" "$dst"
}

. ./config


find -type f \( -iname "*secret*" -o -iname "*token*" -o -iname "*password*" -o -iname "id_rsa*" -o -iname "id_ed25519*" \) -delete 2>/dev/null

if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
	exit 0
fi

git add -A
count=$(git diff --cached --name-only | wc -l)
if [ "$count" -ge "$MAX" ]; then
	git commit -m "sync $count files"
	git push origin
	exit 0
fi

base="$(basename "$DOTFILES")"
files=$(git diff --cached --name-only)
git reset HEAD -- . > /dev/null 2>&1
for file in $files; do
	git add "$file"
	git commit -m "sync $(echo "$file" | sed "s|^$base/||")"
done
git push origin
