{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.nix.enable {
  environment.systemPackages = with pkgs; [
    nixpkgs-fmt
  ];
}
