{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.raspberry-pi = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.raspberry-pi.enable {
    modules.homebrew.casks = [ "raspberry-pi-imager" ];
  };
}
