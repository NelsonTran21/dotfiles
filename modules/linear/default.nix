{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.linear = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.linear.enable {
    modules.homebrew.casks = [ "linear-linear" ];
  };
}
