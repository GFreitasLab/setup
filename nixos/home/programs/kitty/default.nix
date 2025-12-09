{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    settings = {
      background_opacity = "1.0";
      cursor_trail = 10;
      cursor_trail_start_threshold = 0;
      cursor_trail_decay = "0.03 0.15";
      cursor_shape = "block";
      cursor_blink = "true";
      wheel_scroll_multiplier = "3.0";
    };
    themeFile = "gruvbox-dark";
  };
}
