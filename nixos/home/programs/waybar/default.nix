{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
	margin-top = 5;
	margin-right = 10;
	margin-left = 10;
        height = 24;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "pulseaudio" "backlight" "battery" "custom/power" ];

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
          format = " {volume}%";
          format-muted = "";
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
          tooltip = false;
        };

	backlight = {
    	  format = "{icon} {percent}%";
    	  format-icons = [ "" "" "" "" "" "" "" "" "" ];
    	  on-scroll-up = "brightnessctl s 1%+";
    	  on-scroll-down = "brightnessctl s 1%-";
    	  tooltip = false;
    	};

        battery = {
          states = {
            warning = 50;
            critical = 20;
          };

          format = "{icon} {capacity}%";
          format-full = "{icon}";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          tooltip = false;
        };

	"custom/power" = {
          format = "";
          return-type = "json";
          class = "icon";
          on-click = "wlogout --buttons-per-row 5-1";
          tooltip = false;
        };
      }
    ];

    # Aqui é no pelo mesmo, seco seco
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
      #backlight,
      #battery,
      #custom-power {
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
