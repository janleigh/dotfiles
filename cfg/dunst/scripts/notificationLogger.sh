#!/bin/bash

crunch_appname=$(echo "$1" | sed '/^$/d')
crunch_summary=$(echo "$2" | sed '/^$/d' | xargs)
crunch_body=$(echo "$3" | sed '/^$/d' | xargs)
crunch_icon=$(echo "$4" | sed '/^$/d')
crunch_urgency=$(echo "$5" | sed '/^$/d')
timestamp=$(date +"%I:%M %p")

if [[ "$crunch_appname" == "Spotify" ]]; then
    random_name=$(mktemp --suffix ".png")
    artlink=$(playerctl metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')
    curl -s "$artlink" -o "$random_name"
    crunch_icon=$random_name
elif [[ "$crunch_appname" == "VLC media player" ]]; then
    crunch_icon="vlc"
elif [[ "$crunch_appname" == "Calendar" ]] || [[ "$crunch_appname" == "Volume" ]] || [[ "$crunch_appname" == "Brightness" ]] || [[ "$crunch_appname" == "notify-send" ]]; then
    exit 0
fi

echo -en "$timestamp\n$crunch_urgency\n$crunch_icon\n$crunch_body\n$crunch_summary\n$crunch_appname\n" >>$HOME/.cache/dunst.log
