#!/bin/sh

user=$(id -u -n 1000)

# update the system
sudo pacman -Syu --noconfirm

# minimal install
sudo pacman -S --needed --noconfirm base-devel firefox pcmanfm xorg-server xorg-xinit libxinerama gnu-free-fonts libertinus-font adobe-source-han-sans-otc-fonts noto-fonts-emoji noto-fonts pipewire pipewire-pulse pulsemixer gnome-keyring htop neofetch xwallpaper lxappearance

# install yay (aur helper)
git clone https://aur.archlinux.org/yay-bin.git
cd "yay-bin"
makepkg -si --needed --noconfirm
# get out of yay-bin folder
cd ..

# install some necessary packages from the aur
yay -S --needed --noconfirm --batchinstall nerd-fonts-hack lf-bin

# check for xinitrc file, if not copy the one in /etc
#cp /etc/X11/xinit/xinitrc /home/$user/.xinitrc
#[ ! -d "/home/$user/.xinitrc" ] && cp "/etc/X11/xinit/xinitrc" "/home/$user/.xinitrc"

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
cp resources/config/dwmblocks/blocks.h dwmblocks
cd "dwmblocks"
sudo make clean install
cd ..
