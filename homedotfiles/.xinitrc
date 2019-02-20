#!/usr/bin/env sh

export GDK_SCALE=2
export QT_SCALE_FACTOR=2

#Mouse Config
xset m 1 0 &

#Keyboard Config
setxkbmap us -variant colemak -option caps:super &
hsetroot -fill ~/Pictures/chillhop\ radio\ bg.jpg &

#Mount OneDrive Partition
~/.scripts/mount_onedrive.bash &
