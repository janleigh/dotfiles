#!/bin/bash

LOCK_FILE="$HOME/.cache/eww-noticenter.lock"
EWW_BIN="$HOME/.local/bin/eww"

run() {
	${EWW_BIN} open notification-center
	${EWW_BIN} update noticenter=true
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
		${EWW_BIN} update noticenter=false
		sleep 0.4
		${EWW_BIN} close notification-center
		rm "$LOCK_FILE"
	fi
fi
