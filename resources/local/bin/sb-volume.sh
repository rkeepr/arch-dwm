#!/bin/sh

mute="$(pamixer --get-mute)"
vol="$(pamixer --get-volume)"

if [ "$mute" = "true" ]; then
	echo "[🔇 MUTED]"
elif [ "$vol" -gt "69" ]; then
	icon="墳"
elif [ "$vol" -gt "29" ]; then
	icon="奔"
elif [ "$vol" -gt "0" ]; then
	icon="奄"
else
	icon="婢"
fi

echo "[$icon $vol%]"
