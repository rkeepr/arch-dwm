#!/bin/sh

[ ! -d "$HOME/.local/src" ] && mkdir -p "$HOME/.local/src"
cd ~/.local/src
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
curl -Lo dwmblocks.zip https://github.com/torrinfail/dwmblocks/archive/refs/heads/master.zip
unzip dwmblocks.zip
mv dwmblocks-master dwmblocks
cp ~/arch-dwm/resources/dwmblocks/blocks.h dwmblocks
cd "dwmblocks"
sudo make clean install
