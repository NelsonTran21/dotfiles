{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.hue = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.hue.enable {
    modules.homebrew.taps = [ "homebrew/cask-drivers" ];
    modules.homebrew.casks = [ "philips-hue-sync" ];
  };
}
