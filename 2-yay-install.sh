#!/bin/sh

# install yay (aur helper)
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --needed --noconfirm

# get out of yay-bin folder and make another folder
cd ..
mkdir testfolder2

# install some useful packages
yay -S --needed --noconfirm --batchinstall nerd-fonts-hack lf-bin librewolf-bin brave-bin downgrade
