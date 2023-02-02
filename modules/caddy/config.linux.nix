{ config, options, lib, ... }:

with lib;
mkIf config.modules.caddy.enable {
  services.caddy = {
    enable = true;
    virtualHosts = modules.mkAliasDefinitions options.modules.caddy.virtualHosts;
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
