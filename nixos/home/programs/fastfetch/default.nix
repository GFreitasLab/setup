{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "small";
	padding = {
	  right = 2;
	  left = 2;
	};
      };
      display = {
	separator = "";
      };
      modules = [
        {
            key = "| 󰌢 PC ❯ ";
            type = "host";
        }
        {
            key = "|  Age ❯ ";
            type = "command";
            text = "echo $(( ( $(date +%s) - $(stat -c %W /) ) / 86400 )) days";
        }
        {
            key = "|  Uptime ❯ ";
            type = "uptime";
        }
        {
            key = "|  Packages ❯ ";
            type = "packages";
        }
        {
            key = "|  CPU ❯ ";
            type = "cpu";
        }
        {
            key = "|  RAM ❯ ";
            type = "memory";
        }
        {
            key = "|  Disk❯ ";
            type = "disk";
        }
        {
            type = "colors";
        }
      ];
    };
  };
}
