{ lib, ... }:

with lib;
{
  options.modules.exa = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
