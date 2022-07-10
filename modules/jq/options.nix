{ lib, ... }:

with lib;
{
  options.modules.jq = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
