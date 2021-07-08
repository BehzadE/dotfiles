#!/usr/bin/env bash
mv_path=/tmp/monitor
if [ ! -f $mv_path ] ; then
    mode=1
else 
    mode=$(cat $mv_path)
fi

if [ $mode -eq 1 ]; then
    swaymsg "output LVDS-1 dpms off"
    echo 0 > $mv_path
else 
    swaymsg "output LVDS-1 dpms on"
    echo 1 > $mv_path
fi
