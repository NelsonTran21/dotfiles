{ lib, ... }:

with lib;
{
  options.modules.tmux = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
