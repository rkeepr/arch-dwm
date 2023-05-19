#!/bin/sh

vol="$(pamixer --get-volume)"

[ $(pamixer --get-mute) = true ] && echo "[🔇 MUTED]" && exit

if [ "$vol" -gt "69" ]; then
	icon="󰕾"
elif [ "$vol" -gt "29" ]; then
	icon="󰖀"
elif [ "$vol" -gt "0" ]; then
	icon="󰕿"
else
	icon="󰖁"
fi

echo "[$icon $vol%]"
