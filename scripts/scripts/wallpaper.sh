#!/bin/bash

wallpaper=$1

matugen image $wallpaper
# wallust run "$wallpaper"
# pkill -SIGUSR1 kitty
ln -sf "$wallpaper" ~/.config/hypr/current_wallpaper
