{ lib, ... }:

with lib;
{
  options.modules.fd = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
