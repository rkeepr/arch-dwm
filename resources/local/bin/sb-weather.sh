#!/bin/sh

loc=REPLACE_WITH_COORDINATES
emojis=false

if [ "$emojis" = "true" ]; then
	printf "[%s]\n" "$(curl -s wttr.in/$loc?format=1)"
else
	printf "[%s]\n" "$(curl -s wttr.in/$loc?format="%C+%t")"
fi
