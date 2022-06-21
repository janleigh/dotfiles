#!/bin/bash

if [[ -z $(amixer get Master | grep off) ]]; then
    notify-send -a "Volume Manager" -i "$HOME/.config/dunst/assets/notification/volume-off.png" "Audio Muted"
    amixer set Master toggle
else
    amixer set Master toggle
    notify-send -a "Volume Manager" -i "$HOME/.config/dunst/assets/notification/volume-on.png" "Audio On"
fi
