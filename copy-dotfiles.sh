#!/bin/sh
# create folders to copy the dotfiles
mkdir -p "$HOME/.config" "$HOME/.local"

# copy the dotfiles.
cp -r resources/config/* $HOME/.config
cp -r resources/local/* $HOME/.local
cp -r resources/home/. $HOME

# create folders
dir_names="downloads git images videos .ssh .config/git .local/share/mpd/playlists .local/state/bash"
for name in $dir_names
do
	mkdir -p $HOME/$name
done

# modify these config files with current user
current_user=$(id -u -n 1000)
conf_rep="flameshot/flameshot.ini gtk-2.0/gtkrc gtk-3.0/bookmarks"
for conf_name in $conf_rep
do 
	sed -i "s/REPLACE_WITH_USERNAME/$current_user/g" "$HOME/.config/$conf_name"
done

# modify redshift's config file with current location
curl_loc="$(curl -s https://location.services.mozilla.com/v1/geolocate?key=geoclue)"
lat=$(echo $curl_loc | awk '{print $3}' | tr -d ',')
lon=$(echo $curl_loc | awk '{print $5}' | tr -d '},')

sed -i "s/REPLACE_WITH_LATITUDE/$lat/" "$HOME/.config/redshift/redshift.conf"
sed -i "s/REPLACE_WITH_LONGITUDE/$lon/" "$HOME/.config/redshift/redshift.conf"
sed -i "s/REPLACE_WITH_COORDINATES/$lat,$lon/" "$HOME/.local/bin/sb-weather.sh"
sed -i "s/REPLACE_WITH_COORDINATES/$lat,$lon/" "$HOME/.bashrc"
