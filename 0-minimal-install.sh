#!/bin/sh

### basic install
sudo pacman -S --needed --noconfirm $(awk '/#M/{print $1}' resources/pkg-list)

### install aur helper
which yay && echo "aur helper already installed, skipping." || ./install-aur-helper.sh

### suckless
which st dwm dmenu dwmblocks && echo "window manager already installed, skipping." || ./install-window-manager.sh

### copy and modify the dotfiles
./copy-dotfiles.sh
