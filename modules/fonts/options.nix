{ lib, ... }:

with lib;
{
  options.modules.fonts = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
