{ lib, ... }:

with lib;
{
  options.modules.logitech = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
