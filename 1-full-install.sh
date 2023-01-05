#!/bin/sh

### full install
./install-packages.sh

### install aur helper
which yay && echo "aur helper already installed, skipping." || ./install-aur-helper.sh
# install some packages from the aur
pacman -Qm - < resources/aur-packages && echo "aur packages already installed, skipping" || ./install-aur-packages.sh

### suckless
which st dwm dmenu dwmblocks && echo "window manager already installed, skipping." || ./install-window-manager.sh

### copy and modify the dotfiles
./copy-dotfiles.sh
