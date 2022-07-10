{ config, lib, ... }:

with lib;
mkIf config.modules.linear.enable {
  modules.homebrew.casks = [ "linear-linear" ];
}
