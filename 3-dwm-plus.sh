#!/bin/sh

user=$(id -u -n 1000)

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
cp config/dwmblocks/blocks.h dwmblocks
cd "dwmblocks"
sudo make clean install
cd ..

# check if these folders exist, if not create it
[ ! -d "/home/$user/downloads" ] && mkdir -p "/home/$user/downloads"
[ ! -d "/home/$user/images" ] && mkdir -p "/home/$user/images"
[ ! -d "/home/$user/videos" ] && mkdir -p "/home/$user/videos"
[ ! -d "/home/$user/.config" ] && mkdir -p "/home/$user/.config"
[ ! -d "/home/$user/.local" ] && mkdir -p "/home/$user/.local"

# copy dotfiles files.
cp -r config/* /home/$user/.config
cp -r local/* /home/$user/.local
cp -r home/* /home/$user
