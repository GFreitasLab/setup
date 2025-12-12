{ config, ... }:

{
  imports = [
    ./fastfetch
    ./hyprlock
    ./kitty
    ./mako
    ./rofi
    ./tmux
    ./waybar
    ./wlogout
  ];
}
