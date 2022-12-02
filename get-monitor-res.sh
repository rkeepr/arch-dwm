#!/bin/sh

# get monitor resolution with xrandr

res=$(xrandr | awk '/*/ {print $1}')
sed -i "s/^xrandr.*/xrandr -s $res/" "$HOME/.xprofile"

