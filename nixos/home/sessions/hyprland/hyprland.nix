{ config, pkgs, lib, ... }:

{
  imports = [
    ./config/appearance.nix
    ./config/autostart.nix
    ./config/env.nix
    ./config/input.nix
    ./config/keybindings.nix
    ./config/monitors.nix
    ./config/windowrules.nix
  ];

  wayland.windowManager.hyprland.enable = true;
}

