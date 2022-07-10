{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.tailscale.enable {
  services.tailscale.enable = true;
  environment.systemPackages = with pkgs; [ tailscale ];

  networking.firewall = {
    allowedUDPPorts = [ config.services.tailscale.port ];
    checkReversePath = "loose";
  };
}
