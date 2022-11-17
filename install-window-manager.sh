#!/bin/sh

mkdir -p "$HOME/.local/src" && cd ~/.local/src

# dwm and st
for s in dwm st
do
	 git clone https://github.com/rkeepr/$s.git
	 cd $s
	 sudo make clean install
	 cd ..
done

# dmenu
curl -LO https://dl.suckless.org/tools/dmenu-5.2.tar.gz
tar -x -f dmenu-5.2.tar.gz
rm dmenu-5.2.tar.gz
cd "dmenu-5.2"
cp ~/arch-dwm/resources/dmenu/config.h . || echo 'getting "config.h" from the internet' && curl -LO https://raw.githubusercontent.com/rkeepr/arch-dwm/main/resources/dmenu/config.h
sudo make clean install
cd ..

# dwmblocks
git clone https://github.com/torrinfail/dwmblocks.git
cd "dwmblocks"
rm -rf .git
cp ~/arch-dwm/resources/dwmblocks/blocks.h . || echo 'getting "blocks.h" from the internet' && curl -LO https://raw.githubusercontent.com/rkeepr/arch-dwm/main/resources/dwmblocks/blocks.h
sudo make clean install
