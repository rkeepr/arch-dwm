#!/bin/sh

### get better mirrors with reflector
./reflector

### basic install
sudo pacman -S --needed --noconfirm base-devel xorg-server xorg-xinit libxinerama firefox lf thunar thunar-archive-plugin thunar-volman thunar-media-tags-plugin tumbler gvfs xarchiver unrar unzip zip man-db htop ttf-hack-nerd libertinus-font 

### install aur helper
./install-aur-helper.sh

### suckless
./install-window-manager.sh

### go back to script folder
cd ~/arch-dwm

### copy and modify the dotfiles
./copy-dotfiles
