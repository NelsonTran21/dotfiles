{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.skhd = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.skhd.enable {
    modules.homebrew.taps = [ "koekeishiya/formulae" ];
    modules.homebrew.brews = [ "skhd" ];

    modules.home.file = {
      ".config/skhd/skhdrc" = {
        source = ./skhdrc;
        executable = true;
      };
    };
  };
}
