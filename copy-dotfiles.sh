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

# mpd playlist
mkdir -p $HOME/.local/share/mpd/playlists

# get monitor resolution
res=$(xrandr | awk '/*/ {print $1}')
sed -i "s/^xrandr.*/xrandr -s $res/" "$HOME/.xinitrc"

# modify flameshot's config file with current user
user=$(id -u -n 1000)
sed -i "s/user/$user/" "$HOME/.config/flameshot/flameshot.ini"

# modify redshift's config file with current location
curl_loc="$(curl -s https://location.services.mozilla.com/v1/geolocate?key=geoclue)"
lat=$(echo $curl_loc | awk '{print $3}' | tr -d ',')
lon=$(echo $curl_loc | awk '{print $5}' | tr -d '},')

sed -i "s/^lat=/&$lat/" "$HOME/.config/redshift/redshift.conf"
sed -i "s/^lon=/&$lon/" "$HOME/.config/redshift/redshift.conf"
sed -i "s/^loc=/&$lat,$lon/" "$HOME/.local/bin/sb-weather.sh"
sed -i "s|wttr.in/|&$lat,$lon|" "$HOME/.bashrc"
