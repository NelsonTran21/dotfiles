{ lib, ... }:

with lib;
{
  options.modules.home = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };

    user = mkOption {
      type = attrs;
      default = { };
    };

    file = mkOption {
      type = attrs;
      default = { };
    };
  };
}
