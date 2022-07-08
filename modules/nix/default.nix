{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.nix = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.nix.enable {
    environment.systemPackages = with pkgs; [
      nixpkgs-fmt
    ];
  };
}
