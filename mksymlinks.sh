#!/bin/sh

#Quick system setup script for ArcticVanguard's desktop
#Not a good script at all, very unsafe. Hoping to improve that later.
#Doesn't test for installed packages, existing files/folders, or any errors.
#High potential for destruction /!\
#Restart after running

SRC_DIR=/mnt/mnt
REPO=animated-hipster
GIT_USER=arcticvanguard
GIT_DIR=/home/$USER/git/$REPO
AUR_DIR=/home/$USER/git/aur

#External drive links
ln -s $SRC_DIR/Documents ~/Documents
ln -s $SRC_DIR/poetry ~/Poetry
ln -s $SRC_DIR/Pictures ~/Pictures
ln -s $SRC_DIR/Desktop ~/Desktop
ln -s $SRC_DIR/music ~/Music
ln -s $SRC_DIR/Wallpapers ~/Wallpapers
ln -s $SRC_DIR/Movies ~/Movies
ln -s $SRC_DIR/TV ~/TV
ln -s $SRC_DIR/books ~/Books

#Clone git repo
mkdir ~/git/
git clone https://github.com/$GIT_USER/$REPO ~/git

#Git links
ln -s $GIT_DIR/colors/ ~/.colors/
ln -s $GIT_DIR/homedotfiles/.vimrc ~/.vimrc
ln -s $GIT_DIR/homedotfiles/.xinitrc ~/.xinitrc
ln -s $GIT_DIR/homedotfiles/.Xresources ~/.Xresources
ln -s $GIT_DIR/mopidy ~/.config/mopidy
mkdir ~/.ncmpcpp
ln -s $GIT_DIR/ncmpcpp/config ~/.ncmpcpp/config
mkdir -p ~/.config/systemd/user
ln -s $GIT_DIR/systemd/user/mopidy.service ~/.config/systemd/user
systemctl --user enable mopidy

#Package installation
sudo pacman --noconfirm -Syyu
sudo pacman --noconfirm --needed -S \
				xorg-server xorg-server-utils xorg-xinit xorg-xprop xorg-xfd \
				i3-wm i3status \
				nvidia nvidia-libgl \
				pulseaudio mopidy ncmpcpp \
				scrot feh hsetroot imagemagick \
				vlc livestreamer \
				git vim btrfs-progs htop \
				weechat chromium

#Set up vundle
mkdir ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#AUR things
#Install aura
git clone https://aur.archlinux.org/aura-bin.git $AUR_DIR
cd $AUR_DIR/aura-bin
makepkg --install --syncdeps --noconfirm --clean
cd -

#Install st-gruvbox-dark-powerline
cd $GIT_DIR/st-gruvbox-dark-powerline
makepkg --install --syncdeps --noconfirm --clean
cd -

#Install other aura things that don't need manual configuration
sudo aura --noconfirm -A \
				python-powerline powerline-fonts-git \
				ttf-adobe-source-code-pro
