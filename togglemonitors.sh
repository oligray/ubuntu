#!/bin/bash

INFO=$(xrandr | grep -sw '1920x1200' | grep -swv 'connected' | wc -l)
if [ $INFO -eq 2 ]
then
	echo Detected $INFO displays, external supports 1920x1200
	xrandr --output DP-1 --scale 2x2 --mode 1920x1200 --fb 4160x4560 --pos 0x0
	xrandr --output eDP-1 --scale 1x1 --mode 3840x2160 --pos 320x2400
else
	INFO=$(xrandr | grep -sw 'connected' | wc -l)
	echo Detected $INFO displays
	if [ $INFO -lt 2 ]
	then
		echo Switching to laptop monitor
		xrandr --output eDP-1 --scale 1x1 --pos 320x2160
	else
		echo Switching to dual monitors @ 1920x1080
		xrandr --output DP-1 --scale 2x2 --mode 1920x1080 --fb 4160x4320 --pos 0x0
		xrandr --output eDP-1 --scale 1x1 --pos 320x2160
	fi
fi
