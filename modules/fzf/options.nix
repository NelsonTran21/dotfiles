{ lib, ... }:

with lib;
{
  options.modules.fzf = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
