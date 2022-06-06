{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.htop = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.htop.enable {
    environment.systemPackages = with pkgs; [ htop ];
  };
}
