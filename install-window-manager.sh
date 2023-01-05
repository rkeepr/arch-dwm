#!/bin/sh

ordir=$(pwd)

mkdir -p "$HOME/.local/suckless" && cd ~/.local/suckless

# dwm and st
for s in dwm st
do
	[ ! -f $s.zip ] && curl -L https://github.com/rkeepr/$s/archive/refs/heads/main.zip > $s.zip
	unzip -uo $s.zip
	cd $s-main
	sudo make clean install
	cd ..
done

# dmenu
[ ! -f dmenu-5.2.tar.gz ] && curl -LO https://dl.suckless.org/tools/dmenu-5.2.tar.gz
tar -x -f dmenu-5.2.tar.gz
cd "dmenu-5.2"
cp $ordir/resources/dmenu/config.h . || echo 'getting "config.h" from the internet' && curl -LO https://raw.githubusercontent.com/rkeepr/arch-dwm/main/resources/dmenu/config.h
sudo make clean install
cd ..

# dwmblocks
[ ! -f dwmblocks.zip ] && curl -L https://github.com/torrinfail/dwmblocks/archive/refs/heads/master.zip > dwmblocks.zip
unzip -uo dwmblocks.zip
cd "dwmblocks-master"
cp $ordir/resources/dwmblocks/blocks.h . || echo 'getting "blocks.h" from the internet' && curl -LO https://raw.githubusercontent.com/rkeepr/arch-dwm/main/resources/dwmblocks/blocks.h
sudo make clean install
