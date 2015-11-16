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
RES=" 1366x20+0+0"
CONNECTION="wlp1s0"

VIEWMISC=
VIEW0=
VIEW1=
VIEW2=
CHRG=
DNCHRG=
BATFULL=
BAT75=
BAT50=
BAT25=
BATMT=

function statusbar {
function desk() {
	CUR=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	case $CUR in
		0) echo "%{B$BG} $VIEWMISC %{B-}%{B$HL} $VIEW0 %{B-}%{B$BG} $VIEW1 %{B-}%{B$BG} $VIEW2 %{B-}";;
		1) echo "%{B$BG} $VIEWMISC %{B-}%{B$BG} $VIEW0 %{B-}%{B$HL} $VIEW1 %{B-}%{B$BG} $VIEW2 %{B-}";;
		2) echo "%{B$BG} $VIEWMISC %{B-}%{B$BG} $VIEW0 %{B-}%{B$BG} $VIEW1 %{B-}%{B$HL} $VIEW2 %{B-}";;
		9) echo "%{B$HL} $VIEWMISC %{B-}%{B$BG} $VIEW0 %{B-}%{B$BG} $VIEW1 %{B-}%{B$BG} $VIEW2 %{B-}";;
		*) echo "%{B$BG} $VIEWMISC %{B-}%{B$BG} $VIEW0 %{B-}%{B$BG} $VIEW1 %{B-}%{B$BG} $VIEW2 %{B-}";;
	esac
}

function battery() {
	PCT=$(acpi | awk '{print $4}' | sed -e 's/%//g' -e 's/,//g')
	STATUS=$(acpi | awk '{print $3}' | sed 's/,//g')
	if [[ "$STATUS" == "Charging" ]]; then echo $CHRG; fi
	if [[ "$STATUS" == "Full" ]]; then
		echo $DNCHRG $BATFULL
	elif test $PCT -ge 95; then echo $BATFULL
	elif test $PCT -ge 70; then echo $BAT75
	elif test $PCT -ge 35; then echo $BAT50
	elif test $PCT -ge 10; then echo $BAT25
	elif test $PCT -lt 10; then echo $BATMT
	fi
}

function curtime() {
	TIME=$(date +%R)
	echo $TIME
}

function playing() {
	p=$(grep '|>' /home/amelia/.config/pianobar/out | \
		tail -n1 | cut -d'>' -f2 | sed 's/|>  //')
	echo $p
}

function user() {
	echo \[$USER@$(hostname)\]
}

function ipv4() {
	echo $(ip addr show $CONNECTION | grep inet | \
		awk '{print $2}' | head -n1 | sed 's|/24||')
}

echo "%{l}$(desk)%{c}$(playing)%{r}$(battery) $(curtime) %{}"
}
while :; do
	echo $(statusbar)
	#sleep 0.1
done | lemonbar -f "$FONT" -f "$ICONFONT" -g $RES -B $BG -F $FG &
