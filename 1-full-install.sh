#!/bin/sh

### full install
./install-packages.sh

### install aur helper
./install-aur-helper.sh
# install some packages from the aur
./install-aur-packages.sh

### suckless
./install-window-manager.sh

### copy and modify the dotfiles
./copy-dotfiles.sh
