{ lib, ... }:

with lib;
{
  options.modules.prettyping = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
