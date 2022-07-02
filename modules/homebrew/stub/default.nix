{ config, options, lib, pkgs, ... }:

with lib;
{
  options.modules.homebrew = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };

    taps = mkOption {
      type = listOf str;
      default = [ ];
    };

    brews = mkOption {
      type = listOf str;
      default = [ ];
    };

    casks = mkOption {
      type = listOf str;
      default = [ ];
    };
  };
}
