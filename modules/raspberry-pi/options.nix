{ lib, ... }:

with lib;
{
  options.modules.raspberry-pi = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
