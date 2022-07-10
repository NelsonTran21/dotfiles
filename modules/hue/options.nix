{ lib, ... }:

with lib;
{
  options.modules.hue = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
