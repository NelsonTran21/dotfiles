{ lib, ... }:

with lib;
{
  options.modules.flux = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
