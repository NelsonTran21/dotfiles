{ lib, ... }:

with lib;
{
  options.modules.spotify = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
