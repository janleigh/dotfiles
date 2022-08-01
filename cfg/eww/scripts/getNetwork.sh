#!/bin/sh

case $1 in
	"icon")
		[[ $(cat /sys/class/net/w*/operstate) = down ]] && echo "" || echo ""
		;;
	"name")
		SSID=$(iwgetid -r)
		[[ -z "$SSID" ]] && echo "" || echo "$SSID"
		;;
	"trname")
		SSID=$(iwgetid -r)
		[[ -z "$SSID" ]] && echo "" || echo "${SSID::13}..."
		;;
	"color")
		[[ $(cat /sys/class/net/w*/operstate) = down ]] && echo "$bgSecondary" || echo "#1c2325"
		;;
esac
