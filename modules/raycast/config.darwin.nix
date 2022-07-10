{ config, lib, ... }:

with lib;
mkIf config.modules.raycast.enable {
  modules.homebrew.casks = [ "raycast" ];
}
