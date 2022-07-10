{
  description = "@NelsonTran21's dotfiles";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-22.05";
    };

    nixpkgs-darwin = {
      url = "github:NixOS/nixpkgs/nixpkgs-22.05-darwin";
    };

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, darwin, nixpkgs, nixpkgs-darwin, nixos-generators, ... }: {
    darwinConfigurations.nuttybook = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ ./hosts/nuttybook/configuration.nix ];
      specialArgs = { inherit inputs; };
    };

    nixosConfigurations.nuttyberry = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [ ./hosts/nuttyberry/configuration.nix ];
      specialArgs = { inherit inputs; };
    };

    nixosConfigurations.nuttycloud = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hosts/nuttycloud/configuration.nix ];
      specialArgs = {
        inherit inputs;
        isRescueSystem = false;
      };
    };

    packages.x86_64-linux.nuttycloud = nixos-generators.nixosGenerate {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./hosts/nuttycloud/configuration.nix
        ./hosts/nuttycloud/configuration.rescue.nix
      ];
      format = "kexec-bundle";
      specialArgs = {
        inherit inputs;
        isRescueSystem = true;
      };
    };
  };
}
