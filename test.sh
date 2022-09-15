#!/bin/sh

username=$(id -u -n 1000)

# update the system
pacman -Syu --no-confirm

# minimal install
pacman -S --needed --no-confirm firefox pcmanfm xorg-server xorg-xinit libxinerama gnu-free-fonts libertinus-font pipewire gnome-keyring

# copy xinitrc file per archwiki instructions
cp /etc/X11/xinit/xinitrc /home/$username/.xinitrc

# make some folders
mkdir /home/$username/.config /home/$username/.config

# setup yay (aur helper)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --needed --no-confirm
