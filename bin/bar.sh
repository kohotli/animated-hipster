#!/bin/sh

# Color Definitions
dark0="#282828"
dark2="#504945"
light1="#EBDBB2"
neutral_red="#CC241D"
neutral_green="#98971A"
neutral_yellow="#D79921"
neutral_blue="#458588"
neutral_purple="#B16286"
neutral_aqua="#689D6A"
neutral_orange="#D65D0E"

faded_red="#9D0006"
faded_green="#79740E"
faded_yellow="#B57614"
faded_blue="#076678"
faded_purple="#8F32F71"
faded_aqua="#427B58"
faded_orange="#AF3A03"

BG=$dark0
FG=$light1
FONT="Source Code Pro:pixelsize=14"
RES=" 1366x20+0+0"

VIEW0="main"
VIEW1="chat"
VIEW2="term"

function statusbar {
function desk() {
	CUR=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	case $CUR in
		0) echo "%{B$faded_aqua} $VIEW0 %{B-}%{B$dark0} $VIEW1 %{B-}%{B$dark0} $VIEW2 %{B-}";;
		1) echo "%{B$dark0} $VIEW0 %{B-}%{B$faded_aqua} $VIEW1 %{B-}%{B$dark0} $VIEW2 %{B-}";;
		2) echo "%{B$dark0} $VIEW0 %{B-}%{B$dark0} $VIEW1 %{B-}%{B$faded_aqua} $VIEW2 %{B-}";;
		*) echo "%{B$dark0} $VIEW0 %{B-}%{B$dark0} $VIEW1 %{B-}%{B$dark0} $VIEW2 %{B-}";;
	esac
}

function battery() {
	PCT=$(acpi | cut -d',' -f2)
	STATUS=$(acpi | cut -d':' -f2 | cut -d',' -f1)
	echo "Battery$STATUS:$PCT"
}

function curtime() {
	TIME=$(date +%R)
	echo $TIME
}

function playing() {
	p=$(grep '|>' /home/amelia/.config/pianobar/out | tail -n1 | cut -d'>' -f2 | sed 's/|>  //')
	echo $p
}

	echo "%{l}$(desk)%{c}$(playing)%{r}$(battery) | $(curtime) %{}"
}
while :; do
	echo $(statusbar)
	#sleep 0.1
done | lemonbar -f "$FONT" -g $RES -B $BG -F $FG &
