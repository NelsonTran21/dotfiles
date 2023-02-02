{ lib, ... }:

with lib;
{
  options.modules.caddy = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };

    virtualHosts = mkOption {
      type = attrs;
      default = { };
    };
  };
}
