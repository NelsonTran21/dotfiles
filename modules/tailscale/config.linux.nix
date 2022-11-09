{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.tailscale.enable {
  services.tailscale.enable = true;
  environment.systemPackages = with pkgs; [ tailscale ];

  networking.firewall = {
    allowedUDPPorts = [ config.services.tailscale.port ];
    checkReversePath = "loose";
  };

  # The link configuration check for this network interface is flaky.
  # Related: https://github.com/NixOS/nixpkgs/issues/180175
  systemd.network.wait-online.ignoredInterfaces = [ "tailscale0" ];
}
