#!/bin/sh
# Checks if Night Light and Do Not Disturb are enabled after power on or reboot.
DND_LOCK_FILE="$HOME/.cache/dnd-lock.lock"
NL_LOCK_FILE="$HOME/.cache/eww-redshift.lock"

[[ -f "$DND_LOCK_FILE" ]] && dunstctl set-paused true
[[ -f "$NL_LOCK_FILE" ]] && redshift -P -O 5500
