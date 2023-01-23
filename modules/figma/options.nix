{ lib, ... }:

with lib;
{
  options.modules.figma = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
