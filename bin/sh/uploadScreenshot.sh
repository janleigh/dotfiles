#!/bin/bash
# Deps: curl, jq, xclip

_notify() {
    notify-send "$1" "$2"
}

key="[STRENG GEHEIM]"
url="[STRENG GEHEIM]"

if [[ $(file --mime-type -b $1) != "image/png" ]]; then
	rm $1
    _notify "screenshot aborted." && exit 1
fi

imageURL=$(curl -H "Content-Type: multipart/form-data" -H "Authorization: $key" -F file=@$1 "$url" | jq -r '.files[].url')
echo -n $imageURL | xclip -sel c
rm $1
_notify "url copied." "$imageURL"
