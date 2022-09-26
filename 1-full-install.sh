#!/bin/sh

### get better mirrors with reflector
sudo pacman -S --needed --noconfirm reflector
sudo reflector --latest 30 --sort rate --age 12 --protocol https --save /etc/pacman.d/mirrorlist

### full install
sudo pacman -S --needed --noconfirm base-devel xorg-server xorg-xinit libxinerama firefox pcmanfm gvfs xarchiver unrar unzip zip gnu-free-fonts man-db htop ttf-liberation libertinus-font adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-emoji ttf-joypixels pipewire pipewire-pulse pulsemixer pamixer mpd mpc ncmpcpp mpv yt-dlp libdvdcss viewnior lxappearance qt5ct qt6ct xwallpaper redshift unclutter picom papirus-icon-theme materia-gtk-theme kvantum kvantum-theme-materia sxhkd neofetch trash-cli xclip xdotool reflector numlockx dunst slock bc lxtask moreutils bash-completion perl-file-mimeinfo xdg-user-dirs p7zip xcolor cuetools rxvt-unicode simple-scan xsane keepassxc picard gimp imagemagick handbrake qbittorrent amule telegram-desktop libreoffice-fresh atril pdfarranger fcitx5 fcitx5-mozc fcitx5-configtool fcitx5-gtk fcitx5-qt gnome-keyring seahorse polkit-gnome xorg-xev xorg-xkill xorg-xprop xorg-xsetroot xorg-xwininfo virtualbox virtualbox-host-modules-arch linux-headers

### install yay (aur helper)
cd ~/
git clone https://aur.archlinux.org/yay-bin.git
cd "yay-bin"
makepkg -si --needed --noconfirm
# install some necessary packages from the aur
yay -S --needed --noconfirm --sudoloop nerd-fonts-hack lf-bin librewolf-bin brave-bin downgrade gallery-dl shntool flacon

### suckless
mkdir ~/dwm-build && cd ~/dwm-build
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
git clone https://github.com/torrinfail/dwmblocks.git
cp ~/arch-dwm/resources/dwmblocks/blocks.h dwmblocks
cd "dwmblocks"
sudo make clean install

## go back to script folder
cd ~/arch-dwm

### copy and modify the dotfiles

user=$(id -u -n 1000)
current_loc=$(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | awk 'OFS=":" {print $3,$5}' | tr -d ',}')

# check if these folders exist, if not create them
[ ! -d "$HOME/downloads" ] && mkdir -p "$HOME/downloads"
[ ! -d "$HOME/images" ] && mkdir -p "$HOME/images"
[ ! -d "$HOME/videos" ] && mkdir -p "$HOME/videos"
[ ! -d "$HOME/.config" ] && mkdir -p "$HOME/.config"
[ ! -d "$HOME/.local" ] && mkdir -p "$HOME/.local"

# copy the dotfiles
cp -r resources/config/* $HOME/.config
cp -r resources/local/* $HOME/.local
cp -r resources/home/. $HOME

# modify generic "user" for current user
sed -i -e "s/user/$user/" "$HOME/.config/flameshot/flameshot.ini"
sed -i -e "s/user/$user/g" "$HOME/.local/share/lf/marks"

# modify redshift value in xinitrc with current location
sed -i -e "s/replace-loc/$current_loc/" "$HOME/.xinitrc"
