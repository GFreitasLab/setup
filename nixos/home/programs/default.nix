{ config, ... }:

{
  imports = [
    ./fastfetch
    ./hyprlock
    ./kitty
    ./mako
    ./tmux
    ./waybar
    ./wlogout
  ];
}
