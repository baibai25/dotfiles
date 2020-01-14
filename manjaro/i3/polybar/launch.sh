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
    echo "One display"
    MONITOR_primary=$port_nonprimary polybar --reload example0 &
 
elif [ $primary = $nonprimary ]; then
    echo "Mirror"
    MONITOR_primary=$port_nonprimary polybar --reload example0 &
    
elif [ $primary != $nonprimary ]; then
    echo "Multiple"
    
    MONITOR_primary=$port_primary polybar --reload example0 &
    
    for m in $port_nonprimary; do
        MONITOR_sub=$m polybar --reload example1 &
    done
fi

