{ config, lib, ... }:

with lib;
mkIf config.modules.geforce.enable {
  modules.homebrew.casks = [ "nvidia-geforce-now" ];
}
