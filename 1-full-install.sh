#!/bin/sh

quit=$(echo "installation failed, try again." && exit)

### full install
./install-packages.sh || $quit

### install aur helper
which yay && echo "aur helper already installed, skipping." || ./install-aur-helper.sh || $quit

### install some packages from the aur
./install-aur-packages.sh || $quit

### suckless
which st dwm dmenu dwmblocks && echo "window manager already installed, skipping." || ./install-window-manager.sh || $quit

### copy and modify the dotfiles
./copy-dotfiles.sh
