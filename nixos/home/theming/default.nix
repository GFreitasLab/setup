{ pkgs, ... }:

{
  gtk = {
    enable = true;
    
    colorScheme = "dark";
    
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };

    iconTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };
}
