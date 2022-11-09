#!/bin/sh

[ ! -d "$HOME/.local/src" ] && mkdir -p "$HOME/.local/src"
cd ~/.local/src

# dwm
git clone https://github.com/rkeepr/dwm.git
cd "dwm"
sudo make clean install
cd ..

# st
git clone https://github.com/rkeepr/st.git
cd "st"
sudo make clean install
cd ..

# dmenu
curl -LO https://dl.suckless.org/tools/dmenu-5.2.tar.gz
tar -x -f dmenu-5.2.tar.gz
rm dmenu-5.2.tar.gz
cd "dmenu-5.2"
cp ~/arch-dwm/resources/dmenu/config.h .
sudo make clean install
cd ..

# dwmblocks
git clone https://github.com/torrinfail/dwmblocks.git
cd "dwmblocks"
rm -rf .git
cp ~/arch-dwm/resources/dwmblocks/blocks.h .
sudo make clean install
