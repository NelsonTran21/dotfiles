{ lib, ... }:

with lib;
{
  options.modules.vscode = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
