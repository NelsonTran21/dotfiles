{ lib, ... }:

with lib;
{
  options.modules.vim = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
