#!/bin/sh

user=$(id -u -n 1000)

# update the system
sudo pacman -Syu --noconfirm

# minimal install
sudo pacman -S --needed --noconfirm base-devel firefox pcmanfm xorg-server xorg-xinit libxinerama gnu-free-fonts libertinus-font pipewire pipewire-pulse pulsemixer gnome-keyring htop neofetch

# install yay (aur helper)
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --needed --noconfirm
#get out of yay-bin folder
cd ..

# install some necessary packages from the aur
yay -S --needed --noconfirm --batchinstall nerd-fonts-hack lf-bin

# check for xinitrc file, if not found copy the one in /etc
cp /etc/X11/xinit/xinitrc /home/$user/.xinitrc
[ ! -d "/home/$user/.xinitrc" ] && cp "/etc/X11/xinit/xinitrc" "/home/$user/.xinitrc"

# make some folders
mkdir /home/$user/downloads
mkdir /home/$user/images
mkdir /home/$user/videos
# check if ~/.config folder exist. if not create it
[ ! -d "/home/$user/.config" ] && mkdir -p "/home/$user/.config"
