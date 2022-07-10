{ lib, ... }:

with lib;
{
  options.modules.ripgrep = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
