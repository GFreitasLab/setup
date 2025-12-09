{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "noblur, class:^()$, title:^()$"
      "center, floating:1"
      "float, noblur, title:^(Open File|Save File|Save|Save As|Export|Import|Choose File|Rename|Open Folder|All Files)"
      "float, noblur, title:.*(wants to open|wants to save)$"
      "float, noblur, class:(xdg-desktop-portal-gtk)"
      "float, noblur, class:(xdg-desktop-portal-hyprland)"
      "float, noblur, class:(Xdg-desktop-portal-gtk)"
      "float, noblur, class:(Xdg-desktop-portal-hyprland)"
      "float, noblur, title:^(Open File)(.*)$"
      "float, noblur, title:^(Select a File)(.*)$"
      "float, noblur, title:^(Choose wallpaper)(.*)$"
      "float, noblur, title:^(Open Folder)(.*)$"
      "float, noblur, title:^(Save As)(.*)$"
      "float, noblur, title:^(Library)(.*)$"
      "float, noblur, title:^(File Upload)(.*)$"
      "float, class:org.pulseaudio.pavucontrol"
      "float, class:blueman-manager"
      "float, class:nm-connection-editor"
      "float, class:btrfs-assistant"
      "float, class:waypaper"
      "float, class:imv"

      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
    layerrule = [
      "animation slide top, rofi"
    ];
  };
}
