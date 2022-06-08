{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.jetbrains = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.jetbrains.enable {
    modules.homebrew.casks = [
      "datagrip"
      "rider"
      "webstorm"
    ];
  };
}
