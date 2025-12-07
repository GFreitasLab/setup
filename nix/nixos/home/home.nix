{ config, pkgs, ... }:

{
  home.username = "gustavo";
  home.homeDirectory = "/home/gustavo";
  home.stateVersion = "25.11";

  imports = [
    ./fastfetch.nix
    ./git.nix
    ./gtk.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
