#!/bin/bash

ASSETS_DIR="$HOME/.config/dunst/assets/ui"

if [[ -z $(amixer get Master | grep off) ]]; then
	notify-send -a "Volume Manager" -i "$ASSETS_DIR/volume-muted.svg" "Volume Muted" "Volume has been set to 0%"
	amixer set Master toggle
else
	amixer set Master toggle
	notify-send -a "Volume Manager" -i "$ASSETS_DIR/volume-high.svg" "Volume Enabled" "Volume has been set to 100%"
fi
