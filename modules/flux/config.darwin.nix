{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.flux.enable {
  modules.homebrew.casks = [ "flux" ];
}
