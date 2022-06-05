{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.logitech = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.logitech.enable {
    modules.homebrew.taps = [ "homebrew/cask-drivers" ];
    modules.homebrew.casks = [ "logitech-options" ];
  };
}
