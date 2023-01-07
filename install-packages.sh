#!/bin/sh

### full install
sudo pacman -S --needed --noconfirm --color=auto $(awk '!/#[A,a-z, ]/{print $1}' resources/pkg-list)
