{
  wayland.windowManager.hyprland.settings = {
    general = {
      border_size = 1;
      gaps_in = 0;
      gaps_out = 0;
  
      "col.active_border" = "rgba(fabd2fee)";
      "col.inactive_border" = "rgba(282828ee)";
  
      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
    };
  
    decoration = {
      rounding = 0;
  
      active_opacity = 1.0;
      inactive_opacity = 1.0;
  
      shadow = {
        enabled = false;
      };
  
      blur = {
        enabled = false;
      };
    };
  
    animations = {
      enabled = true;
  
      bezier = [
        "linear, 0, 0, 1, 1"
        "md3_standard, 0.2, 0, 0, 1"
        "md3_decel, 0.05, 0.7, 0.1, 1"
        "md3_accel, 0.3, 0, 0.8, 0.15"
        "overshot, 0.05, 0.9, 0.1, 1.1"
        "crazyshot, 0.1, 1.5, 0.76, 0.92"
        "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
        "fluent_decel, 0.1, 1, 0, 1"
        "easeInOutCirc, 0.85, 0, 0.15, 1"
        "easeOutCirc, 0, 0.55, 0.45, 1"
        "easeOutExpo, 0.16, 1, 0.3, 1"
      ];
  
      animation = [
        "windows, 1, 3, md3_decel, slide bottom"
        "border, 1, 10, default"
        "fade, 1, 2.5, md3_decel"
        "workspaces, 1, 3.5, easeOutExpo, slide"
        "specialWorkspace, 1, 3, md3_decel, slidevert"
      ];
    };
  
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };
  
    master = {
      new_status = "master";
    };
  
    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };
  };
}
