{ lib, ... }:

with lib;
{
  options.modules.fish = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
