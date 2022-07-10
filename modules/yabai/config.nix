{ config, lib, ... }:

with lib;
mkIf config.modules.yabai.enable {
  modules.homebrew.taps = [ "koekeishiya/formulae" ];
  modules.homebrew.brews = [ "yabai" ];

  modules.home.file = {
    ".config/yabai/yabairc" = {
      source = ./yabairc;
      executable = true;
    };
  };
}
