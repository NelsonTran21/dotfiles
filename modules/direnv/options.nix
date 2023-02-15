{ lib, ... }:

with lib;
{
  options.modules.direnv = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
