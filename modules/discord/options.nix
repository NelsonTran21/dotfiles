{ lib, ... }:

with lib;
{
  options.modules.discord = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
