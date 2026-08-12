#!/bin/sh
export QT_STYLE_OVERRIDE="adwaita-dark"
export QT_QPA_PLATFORM_THEME="gtk3"
#xrandr --output HDMI-1 --mode 1920x1080 --rate 180
exec dbus-run-session i3
