#!/bin/bash

bspc subscribe node_state | while read -r _ _ _ _ state flag; do
    if [ "$state" != "fullscreen" ]; then
        continue
    fi
    if [ "$flag" == on ]; then
        xdo lower -N eww-bar
    else
        xdo raise -N eww-bar
    fi
done
