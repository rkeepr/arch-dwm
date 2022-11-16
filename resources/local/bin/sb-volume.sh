#!/bin/sh

vol="$(pamixer --get-volume)"

[ $(pamixer --get-mute) = true ] && echo "[🔇 MUTED]" && exit

if [ "$vol" -gt "69" ]; then
	icon="墳"
elif [ "$vol" -gt "29" ]; then
	icon="奔"
elif [ "$vol" -gt "0" ]; then
	icon="奄"
else
	icon="婢"
fi

echo "[$icon $vol%]"
