#!/bin/sh

echo "[cpu:"$(top -bn1 | grep Cpu | awk '{print $2}')"]"
