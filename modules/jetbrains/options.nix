{ lib, ... }:

with lib;
{
  options.modules.jetbrains = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
