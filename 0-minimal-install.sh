#!/bin/sh

### get better mirrors with reflector
sudo pacman -S --needed --noconfirm reflector
sudo reflector --latest 30 --sort rate --age 12 --protocol https --save /etc/pacman.d/mirrorlist

### basic install
sudo pacman -S --needed --noconfirm base-devel xorg-server xorg-xinit libxinerama firefox pcmanfm gvfs xarchiver unrar unzip zip gnu-free-fonts man-db htop

### install yay (aur helper)
cd $HOME
git clone https://aur.archlinux.org/yay-bin.git
cd "yay-bin"
makepkg -si --needed --noconfirm
# install some necessary packages from the aur
yay -S --needed --noconfirm nerd-fonts-hack lf-bin

### suckless
mkdir ~/dwm-build && cd ~/dwm-build
# dwm
git clone https://github.com/rkeepr/dwm.git
cd "dwm"
sudo make clean install
cd ..
# dmenu
git clone https://github.com/rkeepr/dmenu.git
cd "dmenu"
sudo make clean install
cd ..
# st
git clone https://github.com/rkeepr/st.git
cd "st"
sudo make clean install
cd ..
# dwmblocks
git clone https://github.com/torrinfail/dwmblocks.git
cp ~/arch-dwm/resources/dwmblocks/blocks.h dwmblocks
cd "dwmblocks"
sudo make clean install
