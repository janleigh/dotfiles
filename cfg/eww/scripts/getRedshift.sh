#!/bin/sh

LOCK_FILE="$HOME/.cache/eww-redshift.lock"

case $1 in
	"color")
		[[ ! -f "$LOCK_FILE" ]] && echo "$bgSecondary" || echo "#1c2325"
		;;
	"toggle")
		if [[ ! -f "$LOCK_FILE" ]]; then
			touch "$LOCK_FILE"
			redshift -P -O 5500
		else
			rm "$LOCK_FILE"
			redshift -x
		fi
		;;
esac
