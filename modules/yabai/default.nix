{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.yabai = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.yabai.enable {
    modules.homebrew.taps = [ "koekeishiya/formulae" ];
    modules.homebrew.brews = [ "yabai" ];

    modules.home.file = {
      ".config/yabai/yabairc" = {
        source = ./yabairc;
        executable = true;
      };
    };
  };
}
