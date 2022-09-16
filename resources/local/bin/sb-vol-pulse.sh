#!/bin/sh
# needs: pamixer, emojis enabled in dwm, emoji font, nerdfonts or font patched with nerdfonts

mute="$(pamixer --get-mute)"
vol="$(pamixer --get-volume)"
emojis_enabled=false

if [ "$emojis_enabled" = "true" ]; then
	if [ "$mute" = "true" ]; then
		printf "[🔇 MUTED]\n"
	elif [ "$vol" -gt "69" ]; then
		icon="墳"
	elif [ "$vol" -gt "29" ]; then
		icon="奔"
	elif [ "$vol" -gt "0" ]; then
		icon="奄"
	else
		icon="婢"
	fi
	printf "[$icon $vol%%]\n"
else
	if [ "$mute" = "true" ]; then
		printf "[MUTED!!!]\n"
	else
		printf "[vol:$vol%%]\n"
	fi
fi
