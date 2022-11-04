#!/bin/sh

### get better mirrors with reflector
./reflector

### full install
./install-packages.sh

### install yay (aur helper)
./install-yay.sh
# install some packages from the aur
./install-aur-packages.sh

### suckless
./install-window-manager.sh

### go back to script folder
cd ~/arch-dwm

### copy and modify the dotfiles
./copy-dotfiles
