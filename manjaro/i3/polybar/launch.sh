#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Display port
port_primary=`xrandr --query | grep " primary" | cut -d " " -f1`
port_nonprimary=`xrandr --query | grep -v " primary" | grep " connected" | cut -d " " -f1`
port_nonprimaries=(`echo $port_nonprimary`)
echo $port_primary
echo $port_nonprimary

# Check display settings (duplicate or not)
primary=`xrandr --query | grep " primary" | cut -d " " -f4`
nonprimary=`xrandr --query | grep -v " primary" | grep " connected" | cut -d " " -f3`
nonprimaries=(`echo $nonprimary`)
echo $primary
echo $nonprimary

MONITOR_primary=$port_primary polybar --reload single &
for i in ${!nonprimaries[@]}; do
    if [ "$nonprimaries[i]" = "" ]; then
        echo "Single display"
        MONITOR_primary=$port_nonprimaries[i] polybar --reload single &
        break
    
    elif [ $primary = $nonprimaries[i] ]; then
        echo "Mirror"
        MONITOR_primary=$port_nonprimaries[i] polybar --reload mirror &
        
    elif [ $primary != ${nonprimaries[i]} ]; then
        echo "Multiple"

        for m in ${port_nonprimaries[i]}; do
            MONITOR_sub=$m polybar --reload extend &
        done
    fi
done
