#!/bin/sh

### basic install
sudo pacman -S --needed --noconfirm base-devel xorg-server xorg-xinit libxinerama firefox lf thunar thunar-archive-plugin thunar-volman thunar-media-tags-plugin tumbler gvfs xarchiver unzip zip unrar man-db htop ttf-hack-nerd ttf-liberation

### install aur helper
./install-aur-helper.sh

### suckless
./install-window-manager.sh

### copy and modify the dotfiles
./copy-dotfiles.sh
