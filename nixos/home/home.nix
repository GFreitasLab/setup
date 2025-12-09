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
    mako
    swww
    wl-clipboard
    grim
    xfce.thunar
    mpv
    imv
    waypaper
    nwg-look
    gammastep
    networkmanagerapplet
    swayosd
    # Apps
    brave
    obsidian
  ];

  services.swayosd.enable = true;

}
