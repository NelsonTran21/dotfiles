{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.ripgrep.enable {
  environment.systemPackages = with pkgs; [ ripgrep ];
}
