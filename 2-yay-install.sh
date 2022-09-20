#!/bin/sh

# install yay (aur helper)
cd ~/
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --needed --noconfirm
