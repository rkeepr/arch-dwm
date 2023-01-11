#!/bin/sh

### full install
sudo pacman -S --needed --noconfirm --color=auto $(grep -E '^[a-z]' resources/pkg-list | awk '!/#A/{print $1}')
