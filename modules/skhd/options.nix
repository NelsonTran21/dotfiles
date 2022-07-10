{ lib, ... }:

with lib;
{
  options.modules.skhd = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
