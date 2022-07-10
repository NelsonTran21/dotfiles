{ lib, ... }:

with lib;
{
  options.modules.node = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
