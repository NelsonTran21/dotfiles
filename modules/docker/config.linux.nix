{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.docker.enable {
  virtualisation.docker.enable = true;
  modules.home.user.extraGroups = [ "docker" ];
}
