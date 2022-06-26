{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.warp = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.warp.enable {
    modules.homebrew.casks = [ "warp" ];
  };
}
