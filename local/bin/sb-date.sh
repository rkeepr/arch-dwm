#!/bin/sh
# date format = "Mon 01 23:59"
# needs: nerdfonts or font patched with nerdfonts

NERDFONTS=true

if [ "$NERDFONTS" = "true" ]; then
	printf "[ %s]\n" "$(date "+%a %d %R")"
else
	printf "[%s]\n" "$(date "+%a %d %R")"
fi
