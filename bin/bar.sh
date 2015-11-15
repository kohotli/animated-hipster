#!/bin/sh

source ~/git/gruvbox-contrib/sh/colors.sh

function settrans() {
	echo $2 | sed "s/\#/\#$1/g"
}

TRANS="55"
BG="$(settrans $TRANS $dark0)"
FG=$light1
HL=$faded_purple
FONT="Source Code Pro:pixelsize=14"
ICONFONT="FontAwesome:pixelsize=16"
RES=" 1920x20+0+0"

VIEWMISC=""
VIEW0=""
VIEW1=""
VIEW2=""

function statusbar {
function desk() {
	CUR=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	case $CUR in
		0) echo "%{B$BG} $VIEWMISC %{B-}%{B$faded_purple} $VIEW0 %{B-}%{B$BG} $VIEW1 %{B-}%{B$BG} $VIEW2 %{B-}";;
		1) echo "%{B$BG} $VIEWMISC %{B-}%{B$BG} $VIEW0 %{B-}%{B$faded_purple} $VIEW1 %{B-}%{B$BG} $VIEW2 %{B-}";;
		2) echo "%{B$BG} $VIEWMISC %{B-}%{B$BG} $VIEW0 %{B-}%{B$BG} $VIEW1 %{B-}%{B$faded_purple} $VIEW2 %{B-}";;
		9) echo "%{B$faded_purple} $VIEWMISC %{B-}%{B$BG} $VIEW0 %{B-}%{B$BG} $VIEW1 %{B-}%{B$BG} $VIEW2 %{B-}";;
		*) echo "%{B$BG} $VIEWMISC %{B-}%{B$BG} $VIEW0 %{B-}%{B$BG} $VIEW1 %{B-}%{B$BG} $VIEW2 %{B-}";;
	esac
}

function battery() {
	PCT=$(acpi | cut -d',' -f2)
	STATUS=$(acpi | cut -d':' -f2 | cut -d',' -f1)
	echo "Battery$STATUS:$PCT"
}

function curtime() {
	TIME=$(date +%R)
	echo " "$TIME
}

function playing() {
	p=$(grep '|>' /home/amelia/.config/pianobar/out | tail -n1 | cut -d'>' -f2 | sed 's/|>  //')
	echo $p
}

	echo "%{l}$(desk)%{c}$(playing)%{r}$(curtime) %{}"
}
while :; do
	echo $(statusbar)
	#sleep 0.1
done | lemonbar -f "$FONT" -f "$ICONFONT" -g $RES -B $BG -F $FG &
