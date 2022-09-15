#!/bin/sh

#update the system
pacman -Syu
#minimal install
pacman -S --needed firefox pcmanfm xorg-server xorg-xinit libxinerama gnu-freefonts libertinus-font
