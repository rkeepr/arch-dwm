#!/bin/sh

# create folders
dir_names="downloads git images videos .config .local .config/git .local/share/mpd/playlists .local/state/bash"
for d in $dir_names
do
	mkdir -p $HOME/$d
done

# link secondary drives
sd="/mnt/storage"
td="/mnt/torrent"
[ -d $sd ] && ln -s $sd $sd/music $HOME
[ -d $td ] && ln -s $td $HOME

# copy the dotfiles.
cp -r resources/config/* $HOME/.config
cp -r resources/local/* $HOME/.local
cp -r resources/home/. $HOME

# modify these config files with current user
current_user=$(id -u -n 1000)
ftm="flameshot/flameshot.ini gtk-2.0/gtkrc gtk-3.0/bookmarks"
for cf in $ftm
do 
	sed -i "s/REPLACE_WITH_USERNAME/$current_user/g" "$HOME/.config/$cf"
done

# modify redshift's config file with current location
curl_loc="$(curl -s https://location.services.mozilla.com/v1/geolocate?key=geoclue)"
lat=$(echo $curl_loc | awk '{print $3}' | tr -d ',')
lon=$(echo $curl_loc | awk '{print $5}' | tr -d '},')

sed -i "s/REPLACE_WITH_LATITUDE/$lat/" "$HOME/.config/redshift/redshift.conf"
sed -i "s/REPLACE_WITH_LONGITUDE/$lon/" "$HOME/.config/redshift/redshift.conf"
sed -i "s/REPLACE_WITH_COORDINATES/$lat,$lon/" "$HOME/.local/bin/sb-weather.sh"
sed -i "s/REPLACE_WITH_COORDINATES/$lat,$lon/" "$HOME/.bashrc"
