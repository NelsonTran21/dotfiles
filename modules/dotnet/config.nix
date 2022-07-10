{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.dotnet.enable {
  # https://github.com/NixOS/nixpkgs/pull/176000
  # This package is not actually broken.
  # TODO Remove after updating to nixpkgs-22.11-darwin.
  nixpkgs.config.allowBroken = true;
  environment.systemPackages = with pkgs; [ dotnet-sdk_6 ];
}
