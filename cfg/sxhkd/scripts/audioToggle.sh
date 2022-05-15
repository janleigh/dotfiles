#!/bin/bash

if [[ -z $(amixer get Master | grep off) ]]; then
    mpv --keep-open=no --really-quiet "$HOME/.config/sxhkd/assets/audioOff.wav"
    amixer set Master toggle
else
    amixer set Master toggle
    mpv --keep-open=no --really-quiet "$HOME/.config/sxhkd/assets/audioOn.wav"
fi
