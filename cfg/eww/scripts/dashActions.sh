#!/bin/bash

DATE=$(date '+%b%d-%H-%M:%S.png');

EWW_BIN="$HOME/.local/bin/eww"
AIRPLANE_MODE_LOCK_FILE="$HOME/.cache/airplane-mode.lock"
DND_LOCK_FILE="$HOME/.cache/dnd-lock.lock"
JEFF_LOCK_FILE="$HOME/.cache/jeff-lock.lock"
FOCUSED_DESKTOP=$(bspc query -D -d focused --names)

pre_run() {
	if [[ -f "$HOME/.cache/eww-control-center.lock" ]]; then
		sh "$HOME/.config/eww/scripts/openControlCenter.sh"
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
	pre_run && sleep 0.8

	maim -us "$HOME/Pictures/Screenshots/$DATE";
	sh $HOME/.local/bin/viewscr $HOME/Pictures/Screenshots/$DATE
}

run_giph() {
	pre_run && sleep 0.8

	if [[ ! -f "$JEFF_LOCK_FILE" ]]; then
		touch "$JEFF_LOCK_FILE"

		ps x | grep 'ffmpeg -f x11grab' | grep -v grep | awk '{print $1}' | xargs kill
		sh $HOME/.local/bin/jeff selmp4
	else
		rm "$JEFF_LOCK_FILE"
		ps x | grep 'ffmpeg -f x11grab' | grep -v grep | awk '{print $1}' | xargs kill -2
	fi
}

run_am() {
	if [[ ! -f "$AIRPLANE_MODE_LOCK_FILE" ]]; then
		touch "$AIRPLANE_MODE_LOCK_FILE"
		rfkill block wlan
		rfkill block bluetooth
	else
		rm "$AIRPLANE_MODE_LOCK_FILE"
		rfkill unblock wlan
		rfkill unblock bluetooth
	fi
}

run_ocd() {
	pre_run && sleep 0.2
	xdg-open "$HOME/.config/eww"
}

move_to_desktop() {
	if [[ $1 == "up" ]]; then
		[[ $FOCUSED_DESKTOP != "5" ]] && bspc desktop -f ^$((FOCUSED_DESKTOP + 1)) || bspc desktop -f ^1
	elif [[ $1 == "down" ]]; then
		[[ $FOCUSED_DESKTOP != "1" ]] && bspc desktop -f ^$((FOCUSED_DESKTOP - 1)) || bspc desktop -f ^5
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
	"am")
		run_am
		;;
	"dndstat")
		[[ ! -f "$DND_LOCK_FILE" ]] && echo "$bgSecondary" || echo "#1c2325"
		;;
	"jstat")
		[[ ! -f "$JEFF_LOCK_FILE" ]] && echo "$bgSecondary" || echo "#1c2325"
		;;
	"amstat")
		[[ ! -f "$AIRPLANE_MODE_LOCK_FILE" ]] && echo "" || echo ""
		;;
	"ocd")
		run_ocd &
		;;
	"clrnotf")
		pkill dunst && sleep 0.6 && ${EWW_BIN} update reveal_no_notification_text=true
		;;
	"clntfpop")
		${EWW_BIN} update noti=false && sleep 0.275; ${EWW_BIN} close notification-popup; ${EWW_BIN} update has_another_notif=false; pkill openEwwPopup.sh
		rm "$HOME/.cache/eww-notif-popup.lock"
		;;
	"up")
		move_to_desktop "up"
		;;
	"down")
		move_to_desktop "down"
		;;
esac
