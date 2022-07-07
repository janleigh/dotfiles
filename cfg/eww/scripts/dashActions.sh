#!/bin/bash

EWW_BIN="$HOME/.local/bin/eww"
AIRPLANE_MODE_LOCK_FILE="$HOME/.cache/airplane-mode.lock"
DND_LOCK_FILE="$HOME/.cache/dnd-lock.lock"
JEFF_LOCK_FILE="$HOME/.cache/jeff-lock.lock"

pre_run() {
	${EWW_BIN} update dash=false
	sleep 0.4
	${EWW_BIN} close dashboard
	rm "$HOME/.cache/eww-dash.lock"
}

run_dnd() {
	if [[ ! -f "$DND_LOCK_FILE" ]]; then
		touch "$DND_LOCK_FILE"

		dunstctl set-paused true
	else
		rm "$DND_LOCK_FILE"

		dunstctl set-paused false
	fi
}

run_giph() {
	if [[ ! -f "$JEFF_LOCK_FILE" ]]; then
		touch "$JEFF_LOCK_FILE"

		# Some stuff.
		ps x | grep 'ffmpeg -f x11grab' | grep -v grep | awk '{print $1}' | xargs kill

		sh $HOME/.local/bin/jeff selmp4
	elsew
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
	"dnd")
		run_dnd
		;;
	"scrot")
		# Yes, this is different from the sxhkdrc config.
		DATE=$(date '+%b%d-%H-%M.png')
		maim -us | tee "$HOME/Pictures/Screenshots/$DATE" | xclip -selection clipboard -t image/png
		;;
	"jeff")
		run_giph
		;;
	"dndstat")
		if [[ ! -f "$DND_LOCK_FILE" ]]; then
			echo "$bgSecondary"
		else
			echo "#1c2325"
		fi
		;;
	"jstat")
		is_giph_running
		;;
esac
