{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.raycast = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.raycast.enable {
    modules.homebrew.casks = [ "raycast" ];
  };
}
