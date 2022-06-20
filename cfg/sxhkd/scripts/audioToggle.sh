#!/bin/bash

if [[ -z $(amixer get Master | grep off) ]]; then
    notify-send -a "Volume Manager" "Audio Muted"
    amixer set Master toggle
else
    amixer set Master toggle
    notify-send -a "Volume Manager" "Audio On"
fi
