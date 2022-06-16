{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.steam = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.steam.enable {
    modules.homebrew.casks = [ "steam" ];
  };
}
