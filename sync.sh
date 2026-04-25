#!/bin/sh
# ref https://github.com/areofyl

DOTFILES="$(dirname "$0")"

# Sync a file or directory
sync_path() {
	src="$1"
	dst="$DOTFILES/$2"

	[ ! -e "$src" ] && [ ! -e "$dst" ] && return

	if [ -d "$src" ] || [ -d "$dst" ]; then
		mkdir -p "$src" "$dst"

		rsync -a --update "$src"/ "$dst"/
		rsync -a --update "$dst"/ "$src"/
		return
	fi

	if [ ! -e "$src" ]; then
		mkdir -p "$(dirname "$src")"
		cp -a "$dst" "$src"
	elif [ ! -e "$dst" ]; then
		mkdir -p "$(dirname "$dst")"
		cp -a "$src" "$dst"
	elif [ "$src" -nt "$dst" ]; then
		cp -a "$src" "$dst"
	else
		cp -a "$dst" "$src"
	fi
}

# Sync all tracked configs
sync_path "$HOME/.config/nvim/" "nvim/"
sync_path "$HOME/.config/alacritty/" "alacritty/"
sync_path "$HOME/.config/i3/" "i3/"
sync_path "$HOME/.config/i3status/" "i3status/"
sync_path "$HOME/.bashrc" "bash/.bashrc"
sync_path "$HOME/.ascii" "bash/.ascii"
sync_path "$HOME/.xinitrc" "x11/.xinitrc"
sync_path "$HOME/.config/gtk-3.0/" "gtk-3.0/"
sync_path "$HOME/.config/gtk-4.0/" "gtk-4.0/"

# Clean up junk and secrets
find "$DOTFILES" -type f \( -iname "*secret*" -o -iname "*token*" -o -iname "*password*" -o -iname "id_rsa*" -o -iname "id_ed25519*" \) -delete 2>/dev/null

cd "$DOTFILES"

# Nothing to do?
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
	exit 0
fi

# Stage everything, then commit each file individually
git add -A

base="$(basename "$DOTFILES")"

for file in $(git diff --cached --name-only); do
	git reset HEAD -- . > /dev/null 2>&1
	git add "$file"
	git commit -m "sync $(echo "$file" | sed "s|^$base/||")"
done

# Any remaining staged files
git add -A
if ! git diff --cached --quiet; then
	for file in $(git diff --cached --name-only); do
		git reset HEAD -- . > /dev/null 2>&1
		git add "$file"
		git commit -m "sync $(echo "$file" | sed "s|^$base/||")"
	done
fi

# Push to remote
git push origin master 2>/dev/null
