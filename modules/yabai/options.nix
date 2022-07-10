{ lib, ... }:

with lib;
{
  options.modules.yabai = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
