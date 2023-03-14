{ lib, ... }:

with lib;
{
  options.modules.zotero = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
