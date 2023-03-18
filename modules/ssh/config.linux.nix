{ config, lib, ... }:

with lib;
mkIf config.modules.ssh.enable {
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
    };
  };

  networking.firewall.allowedTCPPorts = [ 22 ];
  programs.ssh.extraConfig = readFile ./config;

  modules.home.user = {
    openssh.authorizedKeys.keyFiles = [
      ./authorized_keys
    ];
  };
}
