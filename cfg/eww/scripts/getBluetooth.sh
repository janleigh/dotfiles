#!/bin/sh

case $1 in
	"icon")
		[[ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]] && echo "" || echo ""
		;;
	"status")
		[[ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]] && echo "Off" || echo "On"
		;;
	"supported")
		[[ ! -z $(lsusb | grep "Bluetooth") ]] && echo true || echo false
		;;
esac
