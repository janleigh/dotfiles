#!/bin/sh

case $1 in
	"icon")
		[[ $(cat /sys/class/net/w*/operstate) = down ]] && echo "" || echo ""
		;;
	"name")
		SSID=$(iwgetid -r)
		[[ -z "$SSID" ]] && echo "" || echo "$SSID"
		;;
	"color")
		[[ $(cat /sys/class/net/w*/operstate) = down ]] && echo "$bgSecondary" || echo "#1c2325"
		;;
esac
