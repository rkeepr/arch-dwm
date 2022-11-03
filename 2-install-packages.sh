#!/bin/sh

### get better mirrors with reflector
sudo pacman -S --needed --noconfirm reflector
sudo reflector --latest 30 --sort rate --age 12 --protocol https --save /etc/pacman.d/mirrorlist

### full install
sudo pacman -S --needed --noconfirm base-devel xorg-server xorg-xinit libxinerama firefox lf pcmanfm gvfs xarchiver unrar unzip zip gnu-free-fonts man-db htop ttf-liberation libertinus-font adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-emoji ttf-joypixels pipewire pipewire-pulse pulsemixer pamixer mpd mpc ncmpcpp mpv yt-dlp libdvdcss viewnior lxappearance qt5ct qt6ct xwallpaper redshift unclutter picom papirus-icon-theme materia-gtk-theme kvantum kvantum-theme-materia sxhkd neofetch trash-cli xclip xdotool reflector numlockx dunst slock bc lxtask moreutils bash-completion perl-file-mimeinfo xdg-user-dirs p7zip xcolor cuetools rxvt-unicode simple-scan xsane keepassxc picard gimp imagemagick handbrake qbittorrent amule telegram-desktop libreoffice-fresh atril pdfarranger fcitx5 fcitx5-mozc fcitx5-configtool fcitx5-gtk fcitx5-qt gnome-keyring seahorse polkit-gnome xorg-xev xorg-xkill xorg-xprop xorg-xsetroot xorg-xwininfo virtualbox virtualbox-host-modules-arch linux-headers
