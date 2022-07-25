#!/bin/bash

LOCK_FILE="$HOME/.cache/eww-escreen.lock"
EWW_BIN="$HOME/.local/bin/eww"

hide_unhide_windows() {
	while bspc node any.hidden.window -g hidden=off; do false; done && while bspc node 'any.!hidden.window' -g hidden=on; do :; done
}

run() {
	$HOME/.local/bin/tglbar
	${EWW_BIN} open exit-screen
	hide_unhide_windows
	sleep 0.2
	${EWW_BIN} update escreen=true
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
		${EWW_BIN} update escreen=false
		sleep 0.8
		$HOME/.local/bin/tglbar
		hide_unhide_windows
		${EWW_BIN} close exit-screen
		rm "$LOCK_FILE"
	fi
fi
