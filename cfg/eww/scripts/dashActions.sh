#!/bin/bash

DATE=$(date '+%b%d-%H-%M:%S.png');

EWW_BIN="$HOME/.local/bin/eww"
AIRPLANE_MODE_LOCK_FILE="$HOME/.cache/airplane-mode.lock"
DND_LOCK_FILE="$HOME/.cache/dnd-lock.lock"
JEFF_LOCK_FILE="$HOME/.cache/jeff-lock.lock"

pre_run() {
	if [[ -f "$HOME/.cache/eww-control-center.lock" ]]; then
		${EWW_BIN} update ccenter=false
		sleep 0.8
		${EWW_BIN} close control-center
		rm "$HOME/.cache/eww-control-center.lock"
	fi
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

run_scrot() {
	pre_run & sleep 0.8

	maim -us "$HOME/Pictures/Screenshots/$DATE";
	sh $HOME/.local/bin/viewscr $HOME/Pictures/Screenshots/$DATE
}

run_giph() {
	pre_run & sleep 0.8

	if [[ ! -f "$JEFF_LOCK_FILE" ]]; then
		touch "$JEFF_LOCK_FILE"

		ps x | grep 'ffmpeg -f x11grab' | grep -v grep | awk '{print $1}' | xargs kill
		sh $HOME/.local/bin/jeff selmp4
	else
		rm "$JEFF_LOCK_FILE"
		ps x | grep 'ffmpeg -f x11grab' | grep -v grep | awk '{print $1}' | xargs kill -2
	fi
}

case $1 in
	"dnd")
		run_dnd
		;;
	"scrot")
		run_scrot &
		;;
	"jeff")
		run_giph &
		;;
	"dndstat")
		[[ ! -f "$DND_LOCK_FILE" ]] && echo "$bgSecondary" || echo "#1c2325"
		;;
	"jstat")
		[[ ! -f "$JEFF_LOCK_FILE" ]] && echo "$bgSecondary" || echo "#1c2325"
		;;
esac
