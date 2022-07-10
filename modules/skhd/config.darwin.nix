{ config, lib, ... }:

with lib;
mkIf config.modules.skhd.enable {
  modules.homebrew.taps = [ "koekeishiya/formulae" ];
  modules.homebrew.brews = [ "skhd" ];

  modules.home.file = {
    ".config/skhd/skhdrc" = {
      source = ./skhdrc;
      executable = true;
    };
  };
}
