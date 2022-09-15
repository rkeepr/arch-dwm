#!/bin/sh

username=$(id -u -n 1000)

# update the system
pacman -Syu --noconfirm

# minimal install
pacman -S --needed --noconfirm firefox pcmanfm xorg-server xorg-xinit libxinerama gnu-free-fonts libertinus-font pipewire gnome-keyring htop neofetch

# copy xinitrc file per archwiki instructions
cp /etc/X11/xinit/xinitrc /home/$username/.xinitrc

# make some folders
mkdir /home/$username/.config /home/$username/testdir

# setup yay (aur helper)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --needed --noconfirm
