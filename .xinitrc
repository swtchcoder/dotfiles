#!/bin/sh
pkill pipewire
pkill pipewire-pulse
pkill wireplumber
pipewire &
pipewire-pulse &
wireplumber &
xwallpaper --zoom ~/Pictures/Wallpapers/wallpaper.png
slstatus &
exec dwm
