{ config, ... }:

{
  imports = [
    ./fastfetch.nix
    ./hyprlock.nix
    ./kitty.nix
    ./tmux.nix
    ./waybar.nix
  ];
}
