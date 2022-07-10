{ lib, ... }:

with lib;
{
  options.modules.obsidian = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
