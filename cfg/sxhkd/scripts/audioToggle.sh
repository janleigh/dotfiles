#!/bin/bash

ASSETS_DIR="$HOME/.config/dunst/assets/notification"
LOCK_FILE="$HOME/.cache/vol-muted.lock"

if [[ -z $(amixer get Master | grep off) ]]; then
	notify-send -a "Volume Manager" -i "$ASSETS_DIR/speaker.png" "Volume Muted" "Volume has been muted."
    touch "$LOCK_FILE"
	amixer set Master toggle
else
	amixer set Master toggle
    rm "$LOCK_FILE"
	notify-send -a "Volume Manager" -i "$ASSETS_DIR/speaker.png" "Volume Enabled" "Volume has been unmuted."
fi
