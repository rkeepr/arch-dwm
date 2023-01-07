#!/bin/sh

quit=$(echo "installation failed, try again." && exit)

### basic install
sudo pacman -S --needed --noconfirm $(awk '/#M/{print $1}' resources/pkg-list) || $quit

### install aur helper
which yay && echo "aur helper already installed, skipping." || ./install-aur-helper.sh || $quit
### suckless
which st dwm dmenu dwmblocks && echo "window manager already installed, skipping." || ./install-window-manager.sh || $quit

### copy and modify the dotfiles
./copy-dotfiles.sh
