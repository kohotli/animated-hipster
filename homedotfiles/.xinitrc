#!/usr/bin/env sh

#DPI Scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2

#Nvidia settings
nvidia-settings --load-config-only &

#Mouse Config
xset m 1 0 &

#Keyboard Config
setxkbmap us -variant colemak -option caps:super &
xset r rate 250 33

#Background
#hsetroot -fill ~/Pictures/chillhop\ radio\ bg.jpg &
hsetroot -fill ~/Pictures/joseph-barrientos-49318-unsplash.jpg &

#Compositing
compton -b &

~/animated-hipster/bin/setstatus &

while :; do
	dwm
done
