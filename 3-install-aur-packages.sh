#!/bin/sh

# install yay (aur helper)
cd ~/
git clone https://aur.archlinux.org/yay-bin.git
cd "yay-bin"
makepkg -si --needed --noconfirm
# install some necessary packages from the aur
yay -S --needed --noconfirm --sudoloop nerd-fonts-hack lf-bin librewolf-bin brave-bin downgrade gallery-dl shntool flacon
