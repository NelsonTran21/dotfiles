{ lib, ... }:

with lib;
{
  options.modules.qmk = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
