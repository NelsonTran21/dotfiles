{ lib, ... }:

with lib;
{
  options.modules.linear = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
