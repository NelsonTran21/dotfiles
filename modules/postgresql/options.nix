{ lib, ... }:

with lib;
{
  options.modules.postgresql = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
