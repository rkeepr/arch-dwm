#!/bin/sh

# create folders
for n in downloads git images videos .config .local
do
	mkdir -p $HOME/$n
done

# copy dotfiles.
cp -r resources/config/* $HOME/.config
cp -r resources/local/* $HOME/.local
cp -r resources/home/. $HOME

# get monitor resolution
res=$(xrandr | awk '/*/ {print $1}')
sed -i "s/^xrandr.*/xrandr -s $res/" "$HOME/.xinitrc"

# modify flameshot's config file with current user
user=$(id -u -n 1000)
sed -i "s/user/$user/" "$HOME/.config/flameshot/flameshot.ini"

# modify redshift's config file with current location
CURL_LOC="$(curl -s https://location.services.mozilla.com/v1/geolocate?key=geoclue)"
LAT=$(echo $CURL_LOC | awk '{print $3}' | tr -d ',')
LON=$(echo $CURL_LOC | awk '{print $5}' | tr -d '},')

sed -i "s/^lat=/&$LAT/" "$HOME/.config/redshift/redshift.conf"
sed -i "s/^lon=/&$LON/" "$HOME/.config/redshift/redshift.conf"
sed -i "s/^LOC=/&$LAT,$LON/" "$HOME/.local/bin/sb-weather.sh"
sed -i "s|wttr.in/|&$LAT,$LON|" "$HOME/.bashrc"
