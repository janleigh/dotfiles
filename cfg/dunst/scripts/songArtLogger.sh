#!/bin/bash

TMP_DIR="$HOME/.cache/dunst"
TMP_COVER_PATH=$TMP_DIR/$DUNST_ID.png
TMP_TEMP_PATH=$TMP_DIR/temp.png

if [ ! -d $TMP_DIR ]; then
	mkdir -p $TMP_DIR
fi

ART_LINK="$(playerctl -p spotify,$any,mpd,firefox,chromium,brave metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')"
ART_FROM_BROWSER=$(playerctl metadata mpris:artUrl | sed 's/file:\/\///g')

if [ $(playerctl -p spotify,%any,firefox,chromium,brave,mpd metadata mpris:artUrl) ]; then
	curl -s "$ART_LINK" --output $TMP_TEMP_PATH
elif [[ -n $ART_FROM_BROWSER ]]; then
	cp $ART_FROM_BROWSER $TMP_TEMP_PATH
fi

cp $TMP_TEMP_PATH $TMP_COVER_PATH