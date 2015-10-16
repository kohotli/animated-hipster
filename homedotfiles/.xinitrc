xset m 1 0 &
xset r rate 250 33 &
xrdb .Xresources &
setxkbmap us -variant colemak
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "keycode 66 = Super_L NoSymbol Super_L" &
hsetroot -fill ~/Wallpapers/luminati_wallpaper_by_mvasilkov-d7vxaud.png &
mount /mnt &
exec i3
