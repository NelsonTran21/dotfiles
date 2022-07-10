{ lib, ... }:

with lib;
{
  options.modules.bat = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
