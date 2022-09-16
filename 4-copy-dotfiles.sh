#!/bin/sh

user=$(id -u -n 1000)

# check if these folders exist, if not create them.
[ ! -d "/home/$user/downloads" ] && mkdir -p "/home/$user/downloads"
[ ! -d "/home/$user/images" ] && mkdir -p "/home/$user/images"
[ ! -d "/home/$user/videos" ] && mkdir -p "/home/$user/videos"
[ ! -d "/home/$user/.config" ] && mkdir -p "/home/$user/.config"
[ ! -d "/home/$user/.local" ] && mkdir -p "/home/$user/.local"

# copy dotfiles.
cp -r resources/config/* /home/$user/.config
cp -r resources/local/* /home/$user/.local
cp -r resources/home/* /home/$user/
