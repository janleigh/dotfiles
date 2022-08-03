#!/bin/bash

ASSETS_DIR="$HOME/.config/dunst/assets/notification"

if [[ -z $(amixer get Master | grep off) ]]; then
	notify-send -a "Volume Manager" -i "$ASSETS_DIR/speaker.png" "Volume Muted" "Volume has been muted."
	amixer set Master toggle
else
	amixer set Master toggle
	notify-send -a "Volume Manager" -i "$ASSETS_DIR/speaker.png" "Volume Enabled" "Volume has been unmuted."
fi
