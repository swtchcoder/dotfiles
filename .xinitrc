#!/bin/sh
export QT_STYLE_OVERRIDE="adwaita-dark"
export QT_QPA_PLATFORM_THEME="gtk3"
xrandr \
  --output DP-2 --mode 1920x1200 --rate 60 --pos 0x0 \
  --output DP-0 --mode 1920x1080 --rate 180 --pos 1920x0 &
exec dbus-run-session i3
