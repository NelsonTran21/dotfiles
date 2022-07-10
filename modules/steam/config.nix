{ config, lib, ... }:

with lib;
mkIf config.modules.steam.enable {
  modules.homebrew.casks = [ "steam" ];
}
