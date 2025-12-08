{
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_SIZE,16"
      "XCURSOR_THEME,Bibata-Modern-Classic"
      "HYPRCURSOR_SIZE,16"
      "HYPRCURSOR_THEME,Bibata-Modern-Classic"

      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"

      "GDK_BACKEND,wayland"

      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
    ];
  };
}

