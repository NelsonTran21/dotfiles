{ lib, ... }:

with lib;
{
  options.modules.chrome = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
