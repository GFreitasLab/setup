{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      (fetchTarball "https://github.com/gmodena/nix-flatpak/archive/master.tar.gz")
    ];

  networking.hostName = "nix-machine";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "pt_BR.UTF-8";
  console.keyMap = "br-abnt2";

  
  users.users.gustavo = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" "video" "audio" ];
    shell = pkgs.zsh;
  };

  programs.hyprland.enable = true;

  services.displayManager.ly.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  virtualisation.docker.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # -- Base e Utilitários
    wget
    curl
    git
    unzip
    p7zip
    ripgrep
    fd
    btop
    fastfetch
    brightnessctl
    polkit_gnome
    udisks2

    # -- Áudio e Controle
    pavucontrol
    playerctl

    # -- Desenvolvimento
    kitty
    neovim
    tmux
    nodejs
    python3
    gcc
    gnumake
    docker-compose

    # -- Desktop / Hyprland
    waybar
    rofi-wayland
    dunst
    swww
    wl-clipboard
    grim
    slurp
    thunar
    mpv
    imv
  ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.openssh.enable = true;
  
  services.flatpak.enable = true;
  services.flatpak.remotes = [
    {
      name = "flathub";
      url = "https://flathub.org/repo/flathub.flatpakrepo";
    }
  ];
  services.flatpak.packages = [
    "flathub:app.zen_browser.zen"
    "flathub:org.keepassxc.KeePassXC"
    "flathub:md.obsidian.Obsidian"
  ];

  system.stateVersion = "24.05"; 
}
