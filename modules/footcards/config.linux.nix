{ config, lib, ... }:

with lib;
mkIf config.modules.footcards.enable {
  modules.caddy.virtualHosts = {
    "foot.cards" = {
      extraConfig = ''
         reverse_proxy :3668
      '';
    };
  };
}
