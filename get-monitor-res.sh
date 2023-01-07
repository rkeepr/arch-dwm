#!/bin/sh

# get monitor resolution with xrandr

res=$(xrandr | awk '/*/ {print $1}')
echo "xrandr -s $res/"

