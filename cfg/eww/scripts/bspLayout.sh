#!/bin/bash

FOCUSED_DESKTOP=$(bspc query -D -d focused --names)
LAYOUT=$(bsp-layout get $FOCUSED_DESKTOP)

case $1 in
	"icon")
		if [[ $LAYOUT = "rtall" ]]; then
			echo ""
		elif [[ $LAYOUT = "grid" ]]; then
			echo ""
		elif [[ $LAYOUT = "tiled" ]]; then
			echo ""
		elif [[ $LAYOUT = "wide" ]]; then
			echo ""
		fi
		;;
	"set")
		bsp-layout next --layouts rtall,wide,grid,tiled --master-size 40 --desktop $FOCUSED_DESKTOP
		;;
	"reset")
		bsp-layout set tiled $FOCUSED_DESKTOP
		;;
esac
