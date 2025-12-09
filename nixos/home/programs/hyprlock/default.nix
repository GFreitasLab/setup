{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        grace = 1;
        fractional_scaling = 2;
        hide_cursor = true;
        immediate_render = true;
      };

      background = {
        monitor = "";
        path = "~/.config/hypr/current_wallpaper";
        blur_size = 3;
        blur_passes = 2;
        noise = 0.0117;
        contrast = 1.3000;
        brightness = 0.6000;
        vibrancy = 0.2100;
        vibrancy_darkness = 0.0;
      };

      label = [
        # Hours
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<b><big> $(date +"%H") </big></b>"'';
          color = "rgba(fabd2fee)";
          font_size = 112;
          font_family = "Adwaita Sans";
          shadow_passes = 0;
          shadow_size = 0;
          position = "0, 220";
          halign = "center";
          valign = "center";
        }

        # Minutes
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<b><big> $(date +"%M") </big></b>"'';
          color = "rgba(ebdbb2ee)";
          font_size = 112;
          font_family = "Adwaita Sans";
          shadow_passes = 0;
          shadow_size = 0;
          position = "0, 80";
          halign = "center";
          valign = "center";
        }

        # Today
        {
          monitor = "";
          text = ''cmd[update:18000000] echo "<b><big> "$(date +'%A')" </big></b>"'';
          color = "rgba(d79921ee)";
          font_size = 18;
          font_family = "JetBrainsMono NFM";
          position = "0, -15";
          halign = "center";
          valign = "center";
        }

        # Week
        {
          monitor = "";
          text = ''cmd[update:18000000] echo "<b> "$(date +'%d %b')" </b>"'';
          color = "rgba(928374ee)";
          font_size = 14;
          font_family = "JetBrainsMono Nerd Font 10";
          position = "0, -40";
          halign = "center";
          valign = "center";
        }

        # USER
        {
          monitor = "";
          text = "$USER";
          color = "rgba(fabd2fee)";
          font_size = 14;
          font_family = "JetBrainsMono NFM Bold";
          position = "0, 200";
          halign = "center";
          valign = "bottom";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "250, 50";
          outline_thickness = 0;
          dots_size = 0.26;
          dots_spacing = 0.64;
          dots_center = true;
          dots_rouding = -1;
          rounding = 22;

          outer_color = "rgba(fabd2fee)";
          inner_color = "rgba(29, 32, 33, 0.85)";
          font_color  = "rgba(ebdbb2ee)";
          check_color = "rgba(98971aee)";
          fail_color  = "rgba(cc241dee)";

          fade_on_empty = true;
          placeholder_text = "";
          fail_text = "";

          position = "0, 120";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
