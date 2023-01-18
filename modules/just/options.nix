{ lib, ... }:

with lib;
{
  options.modules.just = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
