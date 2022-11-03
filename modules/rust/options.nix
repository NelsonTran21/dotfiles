{ lib, ... }:

with lib;
{
  options.modules.rust = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
