#!/bin/sh

# configure and enable ufw
sudo ufw limit 22/tcp # ssh
sudo ufw allow 80/tcp # http
sudo ufw allow 443/tcp # https
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow qBittorrent
sudo ufw enable
sudo systemctl enable --now ufw.service
