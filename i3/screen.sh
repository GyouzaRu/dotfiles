#!/bin/bash

f=$(xrandr | grep "HDMI-2 connected")
echo "$f"

if [ "$f" ]; then
    xrandr --output DP-2 --primary --pos 0x0 \
        --output HDMI-2 --pos 0x1080
fi
