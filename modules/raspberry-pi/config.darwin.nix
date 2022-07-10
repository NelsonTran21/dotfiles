{ config, lib, ... }:

with lib;
mkIf config.modules.raspberry-pi.enable {
  modules.homebrew.casks = [ "raspberry-pi-imager" ];
}
