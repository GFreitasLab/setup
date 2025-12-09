{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    
    settings = {
      font = "JetBrains Mono 11";
      
      background-color = "#282828";
      text-color       = "#ebdbb2";
      border-color     = "#3c3836";     
      progress-color   = "over #d79921";
      
      border-size = 1;
      border-radius = 0;
      padding = "10,15";
      margin = "10";
      
      default-timeout = 6000;
      layer = "overlay";
    };

    extraConfig = ''
      [urgency=low]
      background-color=#1d2021
      text-color=#ebdbb2
      border-color=#3c3836
      
      [urgency=normal]
      background-color=#282828
      text-color=#ebdbb2
      border-color=#d79921
      
      [urgency=critical]
      background-color=#cc241d
      text-color=#fbf1c7
      border-color=#fb4934
    '';
  };
}
