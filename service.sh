#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
#Magisk Daemon Helper
# Copyright (C) 2019 Geofferey @ XDA
# License: GPL V3+

while true; do
    latver=$(curl --silent "https://api.github.com/repos/JeelsBoobz/JeelsBypasser/releases/latest" | grep '"tag_name":' | grep -oE 'v[0-9.]+')
    curver=$(cat $MODDIR/module.prop | grep 'version=' | grep -oE 'v[0-9.]+')
    if [[ $curver != $latver ]]; then
        su -lp 2000 -c "cmd notification post -S bigtext -t 'JeelsBypasser' 'Tag' 'JeelsBypasser update available, please update from Magisk Manager!'"
    fi
    sleep 300
done
