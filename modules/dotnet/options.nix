{ lib, ... }:

with lib;
{
  options.modules.dotnet = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
