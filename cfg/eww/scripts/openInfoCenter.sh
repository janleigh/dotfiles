#!/bin/bash

LOCK_FILE="$HOME/.cache/eww-info-center.lock"
EWW_BIN="$HOME/.local/bin/eww"

run() {
	${EWW_BIN} open info-center
	sleep 0.2
	${EWW_BIN} update icenter=true
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
		${EWW_BIN} update icenter=false
		sleep 0.6
		${EWW_BIN} close info-center
		rm "$LOCK_FILE"
	fi
fi
