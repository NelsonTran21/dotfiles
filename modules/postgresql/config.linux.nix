{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.postgresql.enable {
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql_14;
    dataDir = "/data/postgresql";
    authentication = ''
      # type database user address      method
      host   all      all  127.0.0.1/32 password
      host   all      all  ::1/128      password
    '';
  };

  environment.systemPackages = with pkgs; [ pgloader ];
}
