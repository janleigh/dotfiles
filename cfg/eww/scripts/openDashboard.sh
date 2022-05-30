#!/bin/bash

LOCK_FILE="$HOME/.cache/eww-dash.lock"
EWW_BIN="$HOME/.local/bin/eww"

run() {
    ${EWW_BIN} open dashboard
    ${EWW_BIN} update dash=true
}

# Run eww daemon if not running
if [[ ! `pidof eww` ]]; then
    ${EWW_BIN} daemon
    sleep 1
fi

# Open widgets
if [[ ! -f "$LOCK_FILE" ]]; then
    touch "$LOCK_FILE"
    run
else
    ${EWW_BIN} update dash=false && sleep 0.5
    ${EWW_BIN} close dashboard
    rm "$LOCK_FILE"
fi
