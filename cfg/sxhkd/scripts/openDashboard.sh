#!/bin/sh

if [ -z "$(bspc query -N -n .local.focused.\!fullscreen)" ]; then
    sh $HOME/.config/eww/scripts/openDashboard.sh
fi