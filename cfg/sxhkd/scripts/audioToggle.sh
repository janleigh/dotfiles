#!/bin/bash

ASSETS_DIR="$HOME/.config/dunst/assets/notification"

if [[ -z $(amixer get Master | grep off) ]]; then
	notify-send -a "Volume Manager" -i "$ASSETS_DIR/volume-off.png" "Volume Muted"
	amixer set Master toggle
else
	amixer set Master toggle
	notify-send -a "Volume Manager" -i "$ASSETS_DIR/volume-on.png" "Volume Enabled"
fi
