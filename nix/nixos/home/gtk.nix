{ pkgs, ... }:

{
  gtk = {
    enable = true;
    
    colorScheme = "dark";
    
    theme = {
      name = "Orchis-Dark-Compact";
      package = pkgs.orchis-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
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
