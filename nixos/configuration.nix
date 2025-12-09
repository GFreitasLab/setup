{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  systemd.services.nix-gc.script = lib.mkForce ''
    ${pkgs.nix}/bin/nix-env --profile /nix/var/nix/profiles/system --delete-generations +5
    ${pkgs.nix}/bin/nix-collect-garbage
  '';

  nix.settings.auto-optimise-store = true;

  networking.hostName = "nix-machine";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 8000 ];
  };

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "br-abnt2";

  programs.zsh.enable = true;
  programs.hyprland.enable = true;
  
  users.users.gustavo = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" "video" "audio" ];
    shell = pkgs.zsh;
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.gustavo = import ./home/home.nix;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # -- Base e Utilitários
    wget
    curl
    git
    lazygit
    unzip
    p7zip
    ripgrep
    fd
    stow
    btop
    brightnessctl
    polkit_gnome
    udisks2
    xdg-user-dirs
    ffmpegthumbnailer
    poppler
    freetype
    libgsf
    webp-pixbuf-loader
    unrar
    fzf
    tree
    # -- Áudio e Controle
    pavucontrol
    playerctl
    # -- Desenvolvimento
    neovim
    nodejs
    python3
    gcc
    gnumake
    luarocks
    lua
    cargo
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.bluetooth.enable = true;

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

  services = {
    blueman.enable = true;
    udisks2.enable = true;
    openssh.enable = true;
    power-profiles-daemon.enable = true;
    displayManager.ly.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };

  system.stateVersion = "25.11"; 
}
