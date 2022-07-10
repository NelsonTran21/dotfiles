{ config, lib, ... }:

with lib;
mkIf config.modules.tailscale.enable {
  modules.homebrew.casks = [ "tailscale" ];
}
