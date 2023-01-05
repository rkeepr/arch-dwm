#!/bin/sh

### full install
sudo pacman -S --needed --noconfirm --color=auto $(awk '{print $1}' resources/pacman-packages)
