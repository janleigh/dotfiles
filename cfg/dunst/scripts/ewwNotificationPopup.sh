#!/bin/bash

EWW_BIN="$HOME/.local/bin/eww"

APP_NAME=$(echo "$1" | sed '/^$/d')
SUMMARY=$(echo "$2" | sed '/^$/d' | xargs)
BODY=$(echo "$3" | sed '/^$/d' | xargs)
ICON=$(echo "$4" | sed '/^$/d')
TIMESTAMP=$(date +"%I:%M %p")

TITLE=""
HAS_ICON=false

if [[ "$APP_NAME" == "Spotify" ]]; then
	random_name=$(mktemp --suffix ".png")
	artlink=$(playerctl metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')
	curl -s "$artlink" -o "$random_name"
	mv "$random_name" "$HOME/.cache/eww-notif.png"
	ICON=$(echo "$HOME/.cache/eww-notif.png")
	BODY="$(sh $HOME/.config/eww/scripts/getSongArtist)"
elif [[ "$APP_NAME" == "Screenshot Tool" ]]; then
	ICON=$(echo "$HOME/.config/eww/assets/notification/scrot.png")
elif [[ "$APP_NAME" == "Volume Manager" ]]; then
	if [[ -z $(amixer get Master | grep off) ]]; then
		ICON=$(echo "$HOME/.config/eww/assets/notification/volume-on.png")
	else
		ICON=$(echo "$HOME/.config/eww/assets/notification/volume-off.png")
	fi
fi

if [[ "$APP_NAME" == "" ]]; then
	APP_NAME="Notification"
fi

if [[ "$SUMMARY" == "" ]]; then
	SUMMARY="Lorem ipsum"
fi

if [[ ! -f "$ICON" ]]; then
	ICON="./assets/notification/fallback-notif.png"
fi

# Remove () from the summary
SUMMARY=$(echo "$SUMMARY" | sed 's/([^)]*)//g')
BBODY="$SUMMARY\n$BODY"

# le spaghetti
finish() {
	${EWW_BIN} update notification_title="" \
		notification_body="" \
		notification_icon="" \
		notification_timestamp=""
	
	${EWW_BIN} update noti=false; sleep 0.270
	${EWW_BIN} close notification
}

run() {
	${EWW_BIN} update notification_title="${APP_NAME^}" \
		notification_body="$BBODY" \
		notification_icon="$ICON" \
		notification_timestamp="$TIMESTAMP"
}

# Run eww daemon if not running
if [[ ! `pidof eww` ]]; then
	${EWW_BIN} daemon
	sleep 1
else
	KILLED=false
	for pid in $(pidof eww_notif.sh); do
		if [ $pid != $$ ]; then
			kill $pid
			KILLED=true
		fi
	done >/dev/null

	if ! $KILLED; then
		${EWW_BIN} update noti=true
		${EWW_BIN} open notification
	fi

	run
	sleep 6
	finish
	unset KILLED
fi
