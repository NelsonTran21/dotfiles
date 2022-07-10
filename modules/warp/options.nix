{ lib, ... }:

with lib;
{
  options.modules.warp = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
