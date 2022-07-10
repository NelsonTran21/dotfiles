{ lib, ... }:

with lib;
{
  options.modules.python = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
