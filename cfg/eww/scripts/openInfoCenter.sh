#!/bin/bash

LOCK_FILE="$HOME/.cache/eww-info-center.lock"
EWW_BIN="$HOME/.local/bin/eww"

fix_stacking_bug() {
	for entry in $(xdotool search --pid $(pidof eww)); do
		xdo below -N eww-control-panel $entry
	done
}

run() {
	${EWW_BIN} open info-center
	sleep 0.2
	fix_stacking_bug; ${EWW_BIN} update icenter=true; xdo raise -N eww-bar
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
		rm "$LOCK_FILE"
		${EWW_BIN} update icenter=false
		sleep 0.6
		${EWW_BIN} close info-center
		xdo lower -N eww-bar
	fi
fi
