#!/bin/sh

workspaces() {
	# check if Occupied
	o1=$(bspc query -D -d .occupied --names | grep 1)
	o2=$(bspc query -D -d .occupied --names | grep 2)
	o3=$(bspc query -D -d .occupied --names | grep 3)
	o4=$(bspc query -D -d .occupied --names | grep 4)
	o5=$(bspc query -D -d .occupied --names | grep 5)

	# check if Focused
	f1=$(bspc query -D -d focused --names | grep 1)
	f2=$(bspc query -D -d focused --names | grep 2)
	f3=$(bspc query -D -d focused --names | grep 3)
	f4=$(bspc query -D -d focused --names | grep 4)
	f5=$(bspc query -D -d focused --names | grep 5)

	# le spagetti
	content1="◇"
	content2="◇"
	content3="◇"
	content4="◇"
	content5="◇"
	
	[[ "$f1" ]] && content1="◆"
	[[ "$f2" ]] && content2="◆"
	[[ "$f3" ]] && content3="◆"
	[[ "$f4" ]] && content4="◆"
	[[ "$f5" ]] && content5="◆"

	echo "(box	:class \"ws\" :orientation \"h\"	:halign \"center\"	:valign \"start\"	 :space-evenly \"false\" :spacing \"-5\" (button :onclick \"bspc desktop -f 1\"	:class	\"0$o1$f1\"	\"$content1\") (button :onclick \"bspc desktop -f 2\"	:class \"0$o2$f2\"	 \"$content2\") (button :onclick \"bspc desktop -f 3\"	:class \"0$o3$f3\" \"$content3\") (button :onclick \"bspc desktop -f 4\"	:class \"0$o4$f4\"	\"$content4\") (button :onclick \"bspc desktop -f 5\"	:class \"0$o5$f5\" \"$content5\" ))"
}

workspaces
bspc subscribe desktop node_transfer | while read -r _ ; do
workspaces
done
