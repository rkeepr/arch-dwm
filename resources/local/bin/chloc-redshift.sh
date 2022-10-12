#!/bin/sh
# modify the config file for redshift with current location

CURL_LOC="$(curl -s https://location.services.mozilla.com/v1/geolocate?key=geoclue)"
LAT=$(echo $CURL_LOC | awk '{print $3}' | tr -d ',')
LON=$(echo $CURL_LOC | awk '{print $5}' | tr -d '},')

sed -i -e "/lat/c\lat=$LAT" "$HOME/.config/redshift/redshift.conf"
sed -i -e "/lon/c\lon=$LON" "$HOME/.config/redshift/redshift.conf"
