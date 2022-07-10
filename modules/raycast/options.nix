{ lib, ... }:

with lib;
{
  options.modules.raycast = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
