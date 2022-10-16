#!/bin/bash

DATE=$(date '+%b%d-%H-%M:%S.png');

EWW_BIN="$HOME/.local/bin/eww"

hide_unhide_windows() {
	while bspc node any.hidden.window -g hidden=off; do false; done && while bspc node 'any.!hidden.window' -g hidden=on; do :; done
}

pre_run() {
	if [[ -f "$HOME/.cache/eww-escreen.lock" ]]; then
		${EWW_BIN} update escreen=false
		sleep 0.8
		$HOME/.local/bin/tglbar
		hide_unhide_windows
		${EWW_BIN} close exit-screen
		rm "$HOME/.cache/eww-escreen.lock"
	fi
}

run() {
	pre_run && sleep 0.2
	systemctl $1
}

run_logout() {
	pre_run && sleep 0.2
	bspc quit
}

case $1 in
	*)
		run $1 &
		;;
	"logout")
		run_logout &
		;;
esac
