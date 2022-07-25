#!/bin/bash

LOCK_FILE="$HOME/.cache/eww-control-center.lock"
EWW_BIN="$HOME/.local/bin/eww"

run() {
	${EWW_BIN} open control-center
	sleep 0.2
	xdo raise -N eww-bar
	${EWW_BIN} update ccenter=true
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
		${EWW_BIN} update ccenter=false
		sleep 0.8
		${EWW_BIN} close control-center
		xdo lower -N eww-bar
		rm "$LOCK_FILE"
	fi
fi
