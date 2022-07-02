{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.macos = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.macos.enable {
    # - Disable reverse scrolling
    # - Enable universal back and forward
    # - Hide in menu bar
    # - Acceleration = 0
    # - Sensitivity = 0.22
    modules.homebrew.casks = [ "linearmouse" ];
  };
}
