xrandr --output DVI-I-1 --mode 1920x1080
#xrandr --output DVI-I-2 --right-of DVI-I-1
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Super_L'
xset b off
dropbox start
canto-fetch -db
redshift -l 40.0812911:-82.870252 -t 5500k:4500k &
xset r rate 200 33
xcompmgr -n &
#exec i3
exec lxsession
