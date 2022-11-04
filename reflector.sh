#!/bin/sh

### get better mirrors with reflector
sudo pacman -S --needed --noconfirm reflector
sudo reflector --latest 30 --sort rate --age 12 --protocol https --save /etc/pacman.d/mirrorlist
