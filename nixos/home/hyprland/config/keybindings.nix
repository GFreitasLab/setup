{
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$fileManager" = "thunar";
    "$menu" = "rofi -show drun";
    "$screenshot_file" = "~/Pictures/$(date +'%Y-%m-%d_%H-%M-%S').png";

    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, Return, exec, $terminal"
      "$mainMod, Q, killactive"
      "$mainMod, backspace, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod, Super_L, exec, pkill rofi || $menu"
      "$mainMod, Super_R, exec, pkill rofi || $menu"
      "$mainMod, P, pseudo,"
      "$mainMod, T, togglesplit,"
      "$mainMod SHIFT, F, fullscreen,"
      "$mainMod, F, fullscreen, 1"

      "$mainMod SHIFT, W, exec, waypaper"
      "$mainMod, escape, exec, hyprlock"
      "$mainMod, B, exec, pgrep -x waybar && pkill waybar || waybar &"

      "$mainMod, H, movefocus, l"
      "$mainMod, J, movefocus, d"
      "$mainMod, K, movefocus, u"
      "$mainMod, L, movefocus, r"

      "$mainMod, left, movefocus, l"
      "$mainMod, down, movefocus, d"
      "$mainMod, up, movefocus, u"
      "$mainMod, right, movefocus, r"

      "$mainMod SHIFT, H, movewindow, l"
      "$mainMod SHIFT, J, movewindow, d"
      "$mainMod SHIFT, K, movewindow, u"
      "$mainMod SHIFT, L, movewindow, r"

      "$mainMod SHIFT, left, movewindow, l"
      "$mainMod SHIFT, down, movewindow, d"
      "$mainMod SHIFT, up, movewindow, u"
      "$mainMod SHIFT, right, movewindow, r"

      "$mainMod CTRL, H, resizeactive, -10 0"
      "$mainMod CTRL, J, resizeactive, 0 10"
      "$mainMod CTRL, K, resizeactive, 0 -10"
      "$mainMod CTRL, L, resizeactive, 10 0"

      "$mainMod CTRL, left, resizeactive, -10 0"
      "$mainMod CTRL, down, resizeactive, 0 10"
      "$mainMod CTRL, up, resizeactive, 0 -10"
      "$mainMod CTRL, right, resizeactive, 10 0"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizeactive"
      
      ", Print, exec, grimblast --notify save screen $screenshot_file"
      "SHIFT, Print, exec, grimblast --notify save area $screenshot_file"
      "CTRL, Print, exec, grimblast --notify save active $screenshot_file"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume 5 --max-volume 100"
      ",XF86AudioLowerVolume, exec, swayosd-client --output-volume -5"
      ",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"

      "CTRL, F3, exec, swayosd-client --output-volume 5 --max-volume 100"
      "CTRL, F2, exec, swayosd-client --output-volume -5"
      "CTRL, F1, exec, swayosd-client --output-volume mute-toggle"
      "CTRL, F4, exec, swayosd-client --input-volume mute-toggle"

      ",XF86MonBrightnessUp, exec, swayosd-client --brightness +5"
      ",XF86MonBrightnessDown, exec, swayosd-client --brightness -5"

      "CTRL, F12, exec, swayosd-client --brightness +5"
      "CTRL, F11, exec, swayosd-client --brightness -5"
    ];

    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
