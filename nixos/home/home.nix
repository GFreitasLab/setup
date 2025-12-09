{ config, pkgs, ... }:

{
  home.username = "gustavo";
  home.homeDirectory = "/home/gustavo";
  home.stateVersion = "25.11";

  imports = [
    ./shells
    ./hyprland
    ./programs
    ./theming
  ];

  home.packages = with pkgs; [
    # Hyprland
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
