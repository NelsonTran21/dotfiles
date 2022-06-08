{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.postgresql = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.postgresql.enable {
    environment.systemPackages = with pkgs; [ pgcli ];
    modules.homebrew.brews = [ "postgresql" ];
  };
}
