{ config, lib, ... }:

with lib;
mkIf config.modules.factorio.enable {
  services.factorio = {
    enable = true;
    saveName = "hardcore-factory";
    admins = [ "NelsonTran21" ];
    game-name = "NelsonTran21's Server";
    game-password = "cheese";
  };

  networking.firewall.allowedUDPPorts = [ 34197 ];
}
