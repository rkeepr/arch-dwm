#!/bin/sh

EMOJIS=false
LOC=

if [ "$EMOJIS" = "true" ]; then
	printf "[%s]\n" "$(curl -s wttr.in/$LOC?format=1)"
else
	printf "[%s]\n" "$(curl -s wttr.in/$LOC?format="%C+%t")"
fi
