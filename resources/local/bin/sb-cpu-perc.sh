#!/bin/sh

printf "[cpu:%s%%]\n" "$(top -bn1 | grep Cpu | awk '{print $2}')"
