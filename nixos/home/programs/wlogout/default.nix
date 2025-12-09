{ config, pkgs, ... }:

{
  home.file.".config/wlogout/icons".source = ./icons;

  programs.wlogout = {
    enable = true;

    layout = [
      {
          label = "lock";
          action = "hyprlock";
          keybind = "l";
      }
      {
          label = "logout";
          action = "loginctl terminate-user $USER";
          keybind = "e";
      }
      {
          label = "shutdown";
          action = "systemctl poweroff";
          keybind = "s";
      }
      {
          label = "suspend";
          action = "systemctl suspend";
          keybind = "u";
      }
      {
          label = "reboot";
          action = "systemctl reboot";
          keybind = "r";
      }
    ];

    style = ''
      window {
        font-size: 16pt;
        color: #282828;
        background-color: rgba(24, 27, 32, 0.2);
      }

      button {
        all: unset;
        background-color: transparent;
	background-repeat: no-repeat;
        background-position: center;
        background-size: 20%;
        background-color: transparent;
        border-radius: 36px;
        margin: 10px;
        min-width: 100px;
        transition: background-size 0.3s ease-in;
      }

      button:focus {
        background-size: 20%;
        box-shadow: none;
      }
      
      button:hover {
        background-size: 40%;
        background-color: #fabd2f;
        color: transparent;
        box-shadow: inset 0 0 0 9999px rgba(0, 0, 0, 0.2);
      }
      
      #lock {
        background-image: url("./icons/lock.png");
      }
      
      #logout {
        background-image: url("./icons/logout.png");
      }
      
      #suspend {
        background-image: url("./icons/suspend.png");
      }
      
      #shutdown {
        background-image: url("./icons/shutdown.png");
      }
      
      #reboot {
        background-image: url("./icons/reboot.png");
      }
    '';
  };
}
