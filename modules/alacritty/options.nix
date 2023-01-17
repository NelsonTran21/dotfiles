{ lib, ... }:

with lib;
{
  options.modules.alacritty = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
