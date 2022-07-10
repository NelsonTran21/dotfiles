{ lib, ... }:

with lib;
{
  options.modules.iosevka = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
