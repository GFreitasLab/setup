{ config, pkgs, lib, ... }:

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
  systemd.user.services.swayosd.Unit.ConditionEnvironment = lib.mkForce "";
}
