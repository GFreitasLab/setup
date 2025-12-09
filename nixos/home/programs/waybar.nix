{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        height = 24;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "pulseaudio" "battery" ];

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "hyprctl dispatch workspace {name}";
        };

        clock = {
          format = "{:%a %d %b %H:%M}";
          tooltip = false;
        };

        tray = {
          icon-size = 16;
          spacing = 10;
        };

        pulseaudio = {
          format = " {format_source}";
          format-muted = " {format_source}";
          format-source = "";
          format-source-muted = "";
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
          tooltip = false;
        };

        battery = {
          states = {
            warning = 50;
            critical = 20;
          };

          format = "{capacity}% {icon}";
          format-full = "{icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          tooltip = false;
        };
      }
    ];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font Propo";
        font-size: 14px;
      }

      window#waybar {
        background-color: #282828;
        color: #ebdbb2;
      }

      #workspaces,
      #clock,
      #tray,
      #pulseaudio,
      #battery {
        color: #ebdbb2;
        padding: 0 6px;
      }

      #workspaces button {
        color: #ebdbb2;
        padding: 0 2px;
      }

      #workspaces button.active {
        color: #fabd2f;
      }

      #battery.charging {
        color: #98971a;
      }

      #battery.warning {
        color: #fe8019;
      }

      #battery.critical {
        color: #cc241d;
      }
    '';
  };
}
