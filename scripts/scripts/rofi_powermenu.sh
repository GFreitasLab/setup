#!/bin/bash
options="Lock \nLogout 󰠜\nShutdown \nSuspend \nReboot "

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme ~/.config/rofi/powermenu.rasi)

case "$chosen" in
"Lock ")
  hyprlock
  ;;
"Suspend ")
  systemctl suspend
  ;;
"Reboot ")
  systemctl reboot
  ;;
"Shutdown ")
  systemctl poweroff
  ;;
"Logout 󰠜")
  hyprctl dispatch exit
  ;;
esac
