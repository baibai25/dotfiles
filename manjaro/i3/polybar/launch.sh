#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

num=0
# Launch Polybar, using default config location ~/.config/polybar/config
for m in $(polybar --list-monitors | cut -d":" -f1 | sort); do
    #echo "example"$num
    #echo $m
    MONITOR=$m polybar --reload "example"$num &
    num=$((num+1))
done

echo "Polybar launched..."
