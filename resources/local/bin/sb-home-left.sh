#!/bin/sh

DF_OUT="$(df -h /home /mnt/storage)"
HOME_PART="$(echo $DF_OUT | awk '{print $11}')"
STORAGE_PART="$(echo $DF_OUT | awk '{print $17}')"

printf "[ %s  %s]\n" "$HOME_PART" "$STORAGE_PART"
