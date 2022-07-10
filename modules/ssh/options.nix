{ lib, ... }:

with lib;
{
  options.modules.ssh = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
