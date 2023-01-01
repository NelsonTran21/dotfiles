{ lib, ... }:

with lib;
{
  options.modules.docker = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
