{ lib, ... }:

with lib;
{
  options.modules.geforce = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
