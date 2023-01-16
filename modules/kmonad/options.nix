{ lib, ... }:

with lib;
{
  options.modules.kmonad = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
