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
      default = [];
    };

    brews = mkOption {
      type = listOf str;
      default = [];
    };

    casks = mkOption {
      type = listOf str;
      default = [];
    };
  };

  config = mkIf config.modules.homebrew.enable {
    homebrew = {
      enable = true;
      autoUpdate = true;
      taps = modules.mkAliasDefinitions options.modules.homebrew.taps;
      brews = modules.mkAliasDefinitions options.modules.homebrew.brews;
      casks = modules.mkAliasDefinitions options.modules.homebrew.casks;
    };
  };
}
