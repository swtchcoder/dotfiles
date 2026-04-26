#!/bin/sh
DOTFILES="$(dirname "$0")"
MAX=5

sync_path() {
	src="$1"
	dst="$DOTFILES/$2"
	if [ -e "$src" ] || [ "$src" -nt "$dst" ]; then
		rm -rf "$dst"
		mkdir -p "$(dirname "$dst")"
		cp -a "$src" "$dst"
	else
		rm -rf "$src"
		mkdir -p "$(dirname "$src")"
		cp -ra "$dst" "$src"
	fi
}

sync_path "$HOME/.config/nvim" ".config/nvim"
sync_path "$HOME/.config/alacritty" ".config/alacritty"
sync_path "$HOME/.config/i3" ".config/i3"
sync_path "$HOME/.config/i3status" ".config/i3status"
sync_path "$HOME/.bashrc" ".bashrc"
sync_path "$HOME/.ascii" ".ascii"
sync_path "$HOME/.xinitrc" ".xinitrc"
sync_path "$HOME/.config/gtk-3.0" ".config/gtk-3.0"
sync_path "$HOME/.config/gtk-4.0" ".config/gtk-4.0"

find "$DOTFILES" -type f \( -iname "*secret*" -o -iname "*token*" -o -iname "*password*" -o -iname "id_rsa*" -o -iname "id_ed25519*" \) -delete 2>/dev/null

cd "$DOTFILES"

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
