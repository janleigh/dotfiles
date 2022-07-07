#!/bin/bash

LOCK_FILE="$HOME/.cache/eww-dash.lock"
EWW_BIN="$HOME/.local/bin/eww"

prerun() {
	${EWW_BIN} update noticenter=false
	sleep 0.4
	${EWW_BIN} close notification-center
	rm "$HOME/.cache/eww-noticenter.lock"
}

run() {
	${EWW_BIN} open dashboard
	${EWW_BIN} update dash=true
}

# Run eww daemon if not running
if [[ ! `pidof eww` ]]; then
	${EWW_BIN} daemon
	sleep 1
else
	if [[ ! -f "$LOCK_FILE" ]]; then
		touch "$LOCK_FILE"
		prerun
		run
	else
		${EWW_BIN} update dash=false
		sleep 0.4
		${EWW_BIN} close dashboard
		rm "$LOCK_FILE"
	fi
fi
