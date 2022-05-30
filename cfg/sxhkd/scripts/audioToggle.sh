#!/bin/bash

if [[ -z $(amixer get Master | grep off) ]]; then
    notify-send -i "$HOME/.icons/Zafiro-Icons-Dark/panel/22/audio-volume-muted.svg" "Audio Muted"
    mpv --keep-open=no --really-quiet "$HOME/.config/sxhkd/assets/audioOff.wav"
    amixer set Master toggle
else
    amixer set Master toggle
    notify-send -i "$HOME/.icons/Zafiro-Icons-Dark/panel/22/audio-volume-high.svg" "Audio On"
    mpv --keep-open=no --really-quiet "$HOME/.config/sxhkd/assets/audioOn.wav"
fi
