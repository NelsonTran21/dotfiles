{ lib, ... }:

with lib;
{
  options.modules.nix = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
