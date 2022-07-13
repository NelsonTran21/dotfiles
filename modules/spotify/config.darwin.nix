{ config, lib, ... }:

with lib;
mkIf config.modules.spotify.enable {
  modules.homebrew.casks = [ "spotify" ];
}
