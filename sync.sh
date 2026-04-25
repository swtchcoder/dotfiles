#!/bin/sh
# ref https://github.com/areofyl
DOTFILES="$(dirname "$0")"
MAX=2

# Sync a file or directory
sync_path() {
	src="$1"
	dst="$DOTFILES/$2"
	if [ -e "$src" ] || [ "$src" -nt "$dst" ]; then
		mkdir -p "$(dirname "$dst")"
		cp -a "$src" "$dst"
	else
		rm -rf "$src"
		mkdir -p "$(dirname "$src")"
		cp -ra "$dst" "$src"
	fi
}

# Sync all tracked configs
sync_path "$HOME/.config/nvim" ".config/nvim"
sync_path "$HOME/.config/alacritty" ".config/alacritty"
sync_path "$HOME/.config/i3" ".config/i3"
sync_path "$HOME/.config/i3status" ".config/i3status"
sync_path "$HOME/.bashrc" ".bashrc"
sync_path "$HOME/.ascii" ".ascii"
sync_path "$HOME/.xinitrc" ".xinitrc"
sync_path "$HOME/.config/gtk-3.0" ".config/gtk-3.0"
sync_path "$HOME/.config/gtk-4.0" ".config/gtk-4.0"

# Clean up junk and secrets
find "$DOTFILES" -type f \( -iname "*secret*" -o -iname "*token*" -o -iname "*password*" -o -iname "id_rsa*" -o -iname "id_ed25519*" \) -delete 2>/dev/null

cd "$DOTFILES"

# Nothing to do?
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
	exit 0
fi
git add -A
count=$(git diff --cached --name-only | wc -l)
if [ "$count" -ge "$MAX" ]; then
	git commit -m "sync $count files"
else
	base="$(basename "$DOTFILES")"
	git reset HEAD -- . > /dev/null 2>&1
	for file in $(git diff --cached --name-only); do
		git add "$file"
		git commit -m "sync $(echo "$file" | sed "s|^$base/||")"
	done
fi
git push origin
