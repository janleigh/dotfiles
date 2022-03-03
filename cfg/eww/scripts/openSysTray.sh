#!/bin/bash
# Opens eww system tray

LOCK_FILE="$HOME/.cache/eww-sys.lock"
EWW_BIN="$HOME/.local/bin/eww"

run() {
    ${EWW_BIN} open-many system-tray music-player
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
    ${EWW_BIN} close system-tray music-player
    rm "$LOCK_FILE"
fi