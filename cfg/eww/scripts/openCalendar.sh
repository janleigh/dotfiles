#!/bin/bash

LOCK_FILE="$HOME/.cache/eww-calendar.lock"
EWW_BIN="$HOME/.local/bin/eww"

run() {
	${EWW_BIN} open calendar
	${EWW_BIN} update call=true
}

# Run eww daemon if not running
if [[ ! `pidof eww` ]]; then
	${EWW_BIN} daemon
	sleep 1
else
	if [[ ! -f "$LOCK_FILE" ]]; then
		touch "$LOCK_FILE"
		run
	else
		${EWW_BIN} update call=false
		sleep 0.075
		${EWW_BIN} close calendar
		rm "$LOCK_FILE"
	fi
fi
