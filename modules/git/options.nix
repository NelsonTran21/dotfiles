{ lib, ... }:

with lib;
{
  options.modules.git = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
