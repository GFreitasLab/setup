#!/bin/bash

options="󰠠 Performance\n󰚀 Balanced\n󰌪 Power-Saver"

current=$(powerprofilesctl get)

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Profiles" -select "$current" -theme ~/.config/rofi/powerprofiles.rasi)

case "$chosen" in
"󰠠 Performance")
    powerprofilesctl set performance
    ;;
"󰚀 Balanced")
    powerprofilesctl set balanced
    ;;
"󰌪 Power-Saver")
    powerprofilesctl set power-saver
    ;;
esac
