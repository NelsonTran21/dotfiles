{ lib, ... }:

with lib;
{
  options.modules.tldr = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
