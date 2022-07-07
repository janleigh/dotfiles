#!/bin/bash

FOCUSED_DESKTOP=$(bspc query -D -d focused --names)
LAYOUT=$(bsp-layout get $FOCUSED_DESKTOP)

case $1 in
	"icon")
		if [ $LAYOUT = "tall" ]; then
			echo ""
		elif [ $LAYOUT = "grid" ]; then
			echo ""
		elif [ $LAYOUT = "tiled" ]; then
			echo ""
		elif [ $LAYOUT = "even" ]; then
			echo ""
		fi
		;;
	"set")
		bsp-layout next --layouts tall,grid,even,tiled --desktop $FOCUSED_DESKTOP
		;;
	"reset")
		bsp-layout set tiled $FOCUSED_DESKTOP
		;;
esac
