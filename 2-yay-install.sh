#!/bin/sh

# install yay (aur helper)
git clone https://aur.archlinux.org/yay-bin.git
cd yay
makepkg -si --needed --noconfirm
