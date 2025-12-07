{
  description = "Additional configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, ... }: {
    nixosConfigurations.nix-machine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        nix-flatpak.nixosModules.nix-flatpak
	home-manager.nixosModules.home-manager
      ];
    };
  };
}
