{ lib, ... }:

with lib;
{
  options.modules.tailscale = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
