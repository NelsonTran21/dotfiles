{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.bat = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.bat.enable {
    environment.systemPackages = with pkgs; [ bat ];
  };
}
