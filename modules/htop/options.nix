{ lib, ... }:

with lib;
{
  options.modules.htop = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
