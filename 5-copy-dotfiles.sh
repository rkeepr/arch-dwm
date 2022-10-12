#!/bin/sh

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

# modify flameshot's config file with current user
user=$(id -u -n 1000)
sed -i -e "s/user/$user/" "$HOME/.config/flameshot/flameshot.ini"

# modify redshift's config file with current location
CURL_LOC="$(curl -s https://location.services.mozilla.com/v1/geolocate?key=geoclue)"
LAT=$(echo $CURL_LOC | awk '{print $3}' | tr -d ',')
LON=$(echo $CURL_LOC | awk '{print $5}' | tr -d '},')

sed -i -e "s/replace-lat/$LAT/" "$HOME/.config/redshift/redshift.conf"
sed -i -e "s/replace-lon/$LON/" "$HOME/.config/redshift/redshift.conf"
