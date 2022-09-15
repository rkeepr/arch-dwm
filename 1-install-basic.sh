#!/bin/sh

username=$(id -u -n 1000)

# update the system
sudo pacman -Syu --noconfirm

# minimal install
sudo pacman -S --needed --noconfirm base-devel firefox pcmanfm xorg-server xorg-xinit libxinerama gnu-free-fonts libertinus-font pipewire gnome-keyring htop neofetch

# copy xinitrc file per archwiki instructions
cp /etc/X11/xinit/xinitrc /home/$username/.xinitrc

# make some folders
mkdir /home/$username/.config

# install yay (aur helper)
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --needed --noconfirm

# test
mkdir testfolder

# install some useful packages
yay -S nerd-fonts-hack lf-bin librewolf-bin brave-bin downgrade
