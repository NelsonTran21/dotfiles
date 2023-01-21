{ lib, ... }:

with lib;
{
  options.modules.kitty = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
