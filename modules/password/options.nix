{ lib, ... }:

with lib;
{
  options.modules.password = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
