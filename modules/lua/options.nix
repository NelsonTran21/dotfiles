{ lib, ... }:

with lib;
{
  options.modules.lua = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
