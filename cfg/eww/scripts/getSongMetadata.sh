#!/bin/bash

ARTIST=$(playerctl metadata --format '{{ artist }}')
TITLE=$(playerctl metadata --format '{{ title }}')
PLAYER=$(playerctl -p spotify,%any,firefox,chromium,brave,mpd status)

artist() {
	# Check if $title is "Advertisement" cause fuck Spotify.
	# Deathemonic: How about using a spicetify adblocker (The Easy Way) or a adblock script https://github.com/abba23/spotify-adblock (The Chad Way) 
	# Kizu: https://github.com/abba23/spotify-adblock to big to clone for my wifi lmao
	if [[ "$TITLE" = "Advertisement" ]]; then
		echo "Spotify Free"
	else
		[[ -z "$ARTIST" ]] && echo "Unknown Artist" || echo "by $ARTIST"
	fi
}

title() {
	if [[ -z "$TITLE" ]]; then
		echo "Nothing Playing"
	else
		# Eww can't truncate Japanese and Chinese characters.
		if [[ "$TITLE" =~ ^[一-龠]+|[ぁ-ゔ]+|[ァ-ヴー]+ ]]; then
			[[ ${#TITLE} -gt 16 ]] && echo ${TITLE::10}... || echo $TITLE
		else
			echo $TITLE
		fi
		
	fi
}

player_status() {
	if [[ "$PLAYER" = "Playing" ]]; then
		STATUS=""
	elif [[ "$PLAYER" = "Paused" ]]; then
		STATUS=""
	else
		STATUS=""
	fi

	echo $STATUS
}

player_status_text() {
	PLAYER_NAME=$(playerctl -l)
	PLAYER_NAME=$(echo $PLAYER_NAME | cut -d '.' -f 1)

	if [[ "$PLAYER" = "Playing" ]]; then
		echo "Now Playing - via ${PLAYER_NAME^}"
	else
		echo "Music"
	fi
}

position() {
	POSITION=$(playerctl position | sed 's/..\{6\}$//')
	DURATION=$(playerctl metadata mpris:length | sed 's/.\{6\}$//')
	
	# Author Notes:
	# Deathemonic: It check if the position is greater than 0 then execute the position if not just echo a empty space
	# Why do this? Because playerctl can't detect position on some players like firefox and spotify, and instead of manually modifying the script it just detects
	if [[ $POSITION -gt 0 ]]; then
		printf "%0d:%02d" $((POSITION % 3600 / 60)) $((POSITION % 60))
		printf " / "
		printf "%0d:%02d" $((DURATION % 3600 / 60)) $((DURATION % 60))
	else
		echo ""
	fi
}

case $1 in
	"artist") artist;;
	"title") title;;
	"player_status") player_status;;
	"player_status_text") player_status_text;;
	"position") position;;
esac
