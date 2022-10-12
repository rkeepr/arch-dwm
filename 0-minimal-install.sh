#!/bin/sh

### get better mirrors with reflector
sudo pacman -S --needed --noconfirm reflector
sudo reflector --latest 30 --sort rate --age 12 --protocol https --save /etc/pacman.d/mirrorlist

### basic install
sudo pacman -S --needed --noconfirm base-devel xorg-server xorg-xinit libxinerama firefox pcmanfm gvfs xarchiver unrar unzip zip gnu-free-fonts man-db htop

### install yay (aur helper)
cd ~/
git clone https://aur.archlinux.org/yay-bin.git
cd "yay-bin"
makepkg -si --needed --noconfirm
# install some necessary packages from the aur
yay -S --needed --noconfirm nerd-fonts-hack lf-bin

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

# modify flameshot's config file with current user
user=$(id -u -n 1000)
sed -i -e "s/user/$user/" "$HOME/.config/flameshot/flameshot.ini"

# modify redshift's config file with current location
CURL_LOC="$(curl -s https://location.services.mozilla.com/v1/geolocate?key=geoclue)"
LAT=$(echo $CURL_LOC | awk '{print $3}' | tr -d ',')
LON=$(echo $CURL_LOC | awk '{print $5}' | tr -d '},')

sed -i -e "s/replace-lat/$LAT/" "$HOME/.config/redshift/redshift.conf"
sed -i -e "s/replace-lon/$LON/" "$HOME/.config/redshift/redshift.conf"
