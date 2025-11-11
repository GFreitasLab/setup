#!/bin/bash

options="Catppuccin\nDracula\nEverforest\nGruvbox\nNord\nRose Pine\nSolarized\nTokyo Night\nMatugen\nWallust"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Theme" -theme ~/.config/rofi/themes.rasi)

[ -z "$chosen" ] && exit

f_chosen="${chosen,,}"
f_chosen="${f_chosen// /_}"

~/scripts/reload_theme.sh "$f_chosen"
