{
  description = "@NelsonTran21's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";
    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs }: {
    darwinConfigurations."nuttybook" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ ./hosts/nuttybook/configuration.nix ];
    };
  };
}
