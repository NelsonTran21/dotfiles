{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.iosevka = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.iosevka.enable {
    modules.homebrew.taps = [ "homebrew/cask-fonts" ];
    modules.homebrew.casks = [ "font-iosevka" ];
  };
}
