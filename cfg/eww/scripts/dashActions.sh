#!/bin/bash

JEFF_LOCK_FILE="$HOME/.cache/jeff-lock.lock"

pre_run() {
	# Close eww dashboard
	sh $HOME/.config/eww/scripts/openDashboard.sh
}

run_giph() {
	if [[ ! -f "$JEFF_LOCK_FILE" ]]; then
		touch "$JEFF_LOCK_FILE"

		# Some stuff.
		ps x | grep 'ffmpeg -f x11grab' | grep -v grep | awk '{print $1}' | xargs kill

		sh $HOME/.local/bin/jeff selmp4
	else
		rm "$JEFF_LOCK_FILE"
		ps x | grep 'ffmpeg -f x11grab' | grep -v grep | awk '{print $1}' | xargs kill -2
	fi
}

is_giph_running() {
	if [[ ! -f "$JEFF_LOCK_FILE" ]]; then
		echo "$bgSecondary"
	else
		echo "#1c2325"
	fi
}

case $1 in
	"scrot")
		# Yes, this is different from the sxhkdrc config.
		pre_run

		DATE=$(date '+%b%d-%H-%M.png')
		maim -us | tee "$HOME/Pictures/Screenshots/$DATE" | xclip -selection clipboard -t image/png
		;;
	"jeff")
		pre_run
		
		run_giph
		;;
	"jstat")
		is_giph_running
		;;
esac
