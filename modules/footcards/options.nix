{ lib, ... }:

with lib;
{
  options.modules.footcards = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
