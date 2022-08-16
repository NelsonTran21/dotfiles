{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.obsidian.enable {
  environment.systemPackages = [ pkgs.obsidian ];
}
