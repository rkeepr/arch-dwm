#!/bin/sh
# needs: nerdfonts or font patched with nerdfonts

NERDFONTS=true
DF_OUT="$(df -h /home /mnt/storage)"
HOME_PART="$(echo $DF_OUT | awk '{print $11}')"
STORAGE_PART="$(echo $DF_OUT | awk '{print $17}')"

if [ "$NERDFONTS" = "true" ]; then
	printf "[ %s  %s]\n" "$HOME_PART" "$STORAGE_PART"
else
	printf "[/home:%s /storage:%s]\n" "$HOME_PART" "$STORAGE_PART"
fi
