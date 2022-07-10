{ lib, ... }:

with lib;
{
  options.modules.macos = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
