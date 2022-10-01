#!/bin/sh

user=$(id -u -n 1000)
current_loc=$(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | awk 'OFS=":" {print $3,$5}' | tr -d ',}')

# check if these folders exist, if not create them.
[ ! -d "$HOME/downloads" ] && mkdir -p "$HOME/downloads"
[ ! -d "$HOME/git" ] && mkdir -p "$HOME/git"
[ ! -d "$HOME/images" ] && mkdir -p "$HOME/images"
[ ! -d "$HOME/videos" ] && mkdir -p "$HOME/videos"
[ ! -d "$HOME/.config" ] && mkdir -p "$HOME/.config"
[ ! -d "$HOME/.local" ] && mkdir -p "$HOME/.local"

# copy dotfiles.
cp -r resources/config/* $HOME/.config
cp -r resources/local/* $HOME/.local
cp -r resources/home/. $HOME

# modify generic "user" for current user
sed -i -e "s/user/$user/" "$HOME/.config/flameshot/flameshot.ini"

# modify redshift value in xinitrc with current location
sed -i -e "s/replace-loc/$current_loc/" "$HOME/.xinitrc"
