#!/bin/sh

printf "[mem:%s]\n" "$(free -h | grep 'Mem' | awk '{print $3}')"
