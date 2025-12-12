{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    font = "JetBrainsMono Nerd Font Propo 12";
    modes = [ "drun" ];

    extraConfig = {
      drun-display-format = "{name}";
      show-icons = true;
    };

    theme = "${pkgs.writeText "config.rasi" ''
      * {
          background-color: transparent;
          text-color: #ebdbb2;
      }
      
      window {
          location: north;
          anchor: center;
          width: 360;
          background-color: #282828;
      }
      
      inputbar {
          enabled: false;
      }
      
      listview {
          columns: 1;
          fixed-height: false;
      }
      
      element {
          spacing: 0 0 0 8px;
          padding: 4 8px;
      }
      
      element selected normal, element selected active {
          background-color: #fabd2f;
          text-color: #282828;
      }
      
      element-icon {
          size: 1em;
          vertical-align: 0.5;
      }
      
      element-text {
          text-color: inherit;
      }
    ''}";
  };
}
