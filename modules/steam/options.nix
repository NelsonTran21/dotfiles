{ lib, ... }:

with lib;
{
  options.modules.steam = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
