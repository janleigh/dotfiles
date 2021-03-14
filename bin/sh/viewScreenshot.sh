#!/bin/bash

_notify() {
    notify-send "$1" "$2"
}

if [[ $(file --mime-type -b $1) != "image/png" ]]; then
	rm $1
    _notify "screenshot aborted." && exit 1
fi

notify-send "screenshot taken!"; sleep 1
viewnior "$1"
