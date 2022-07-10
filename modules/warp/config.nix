{ config, lib, ... }:

with lib;
mkIf config.modules.warp.enable {
  modules.homebrew.casks = [ "warp" ];
}
