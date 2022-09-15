#!/bin/sh

# install yay (aur helper)
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --needed --noconfirm

# test
mkdir testfolder2

# install some useful packages
yay -S nerd-fonts-hack lf-bin librewolf-bin brave-bin downgrade
