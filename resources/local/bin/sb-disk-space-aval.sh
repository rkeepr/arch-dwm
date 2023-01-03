#!/bin/sh

df_out="$(df -h /home /mnt/storage /mnt/torrent)"
home_part="$(echo $df_out | awk '{print $11}')"
storage_part="$(echo $df_out | awk '{print $17}')"
torrent_part="$(echo $df_out | awk '{print $23}')"

echo "[ "$home_part"  "$storage_part"  "$torrent_part"]"
