#!/bin/sh

pkgs=$(awk '/#A/{print $1}' resources/pkg-list)
pacman -Qm $pkgs && echo "AUR packages already installed, skipping" || yay -S --needed --noconfirm --sudoloop $pkgs
