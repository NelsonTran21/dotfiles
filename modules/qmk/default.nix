{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.qmk = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.qmk.enable {
    modules.homebrew.taps = [ "homebrew/cask-drivers" ];
    modules.homebrew.casks = [ "qmk-toolbox" ];
  };
}
