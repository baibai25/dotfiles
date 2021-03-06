#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Display port
port_primary=`xrandr --query | grep " primary" | cut -d " " -f1`
port_nonprimary=`xrandr --query | grep -v " primary" | grep " connected" | cut -d " " -f1`

# Check display settings (duplicate or not)
primary=`xrandr --query | grep " primary" | cut -d " " -f4`
nonprimary=`xrandr --query | grep -v " primary" | grep " connected" | cut -d " " -f3`

if [ "$nonprimary" = "" ]; then
    echo "Single display"
    MONITOR_primary=$port_nonprimary polybar --reload single &
 
elif [ $primary = $nonprimary ]; then
    echo "Mirror"
    MONITOR_primary=$port_nonprimary polybar --reload mirror &
    
elif [ $primary != $nonprimary ]; then
    echo "Multiple"
    MONITOR_primary=$port_primary polybar --reload single &
    
    for m in $port_nonprimary; do
        MONITOR_sub=$m polybar --reload extend &
    done
fi

