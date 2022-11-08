{ lib, ... }:

with lib;
{
  options.modules.factorio = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
