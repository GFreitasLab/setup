{ config, pkgs, ... }:

{
  home.username = "gustavo";
  home.homeDirectory = "/home/gustavo";
  home.stateVersion = "25.11";

  imports = [
    ./shells/git.nix
    ./shells/zsh.nix
    ./sessions/hyprland/hyprland.nix
    ./programs/fastfetch.nix
    ./programs/hyprlock.nix
    ./programs/tmux.nix
    ./programs/kitty.nix
    ./theming/gtk.nix
  ];

  home.packages = with pkgs; [
    # Hyprland
    waybar
    rofi
    dunst
    swww
    wl-clipboard
    grim
    slurp
    xfce.thunar
    mpv
    imv
    waypaper
    hyprlock
    nwg-look
    gammastep
    networkmanagerapplet
    # Apps
    brave
    obsidian
  ];
}
