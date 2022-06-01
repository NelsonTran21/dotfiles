{
  description = "@NelsonTran21's dotfiles";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";
    };

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, darwin, ... }: {
    darwinConfigurations."nuttybook" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ ./hosts/nuttybook/configuration.nix ];
      specialArgs = { inherit inputs; };
    };
  };
}
