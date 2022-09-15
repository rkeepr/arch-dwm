#!/bin/sh

username=$(id -u -n 1000)

# update the system
sudo pacman -Syu --noconfirm

# minimal install
sudo pacman -S --needed --noconfirm base-devel firefox pcmanfm xorg-server xorg-xinit libxinerama gnu-free-fonts libertinus-font pipewire gnome-keyring htop neofetch

# install yay (aur helper)
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --needed --noconfirm

#get out of yay-bin folder
cd ..

# install some useful packages
yay -S --needed --noconfirm --batchinstall nerd-fonts-hack lf-bin librewolf-bin brave-bin downgrade

# copy xinitrc file per archwiki instructions
cp /etc/X11/xinit/xinitrc /home/$username/.xinitrc

# make some folders
mkdir /home/$username/.config
