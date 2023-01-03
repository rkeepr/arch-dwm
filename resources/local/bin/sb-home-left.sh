#!/bin/sh

df_out="$(df -h /home /mnt/storage)"
home_part="$(echo $df_out | awk '{print $11}')"
storage_part="$(echo $df_out | awk '{print $17}')"

echo "[ "$home_part"  "$storage_part"]"
