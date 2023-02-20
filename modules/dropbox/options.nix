{ lib, ... }:

with lib;
{
  options.modules.dropbox = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
