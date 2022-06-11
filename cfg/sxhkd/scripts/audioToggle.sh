#!/bin/bash

if [[ -z $(amixer get Master | grep off) ]]; then
    notify-send -i "$HOME/.icons/Zafiro-Icons-Dark/panel/22/audio-volume-muted.svg" "Audio Muted"
    amixer set Master toggle
else
    amixer set Master toggle
    notify-send -i "$HOME/.icons/Zafiro-Icons-Dark/panel/22/audio-volume-high.svg" "Audio On"
fi
