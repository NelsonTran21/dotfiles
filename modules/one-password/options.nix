{ lib, ... }:

with lib;
{
  options.modules.one-password = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
