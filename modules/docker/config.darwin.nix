{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.docker.enable {
  modules.homebrew.casks = [ "docker" ];
}
