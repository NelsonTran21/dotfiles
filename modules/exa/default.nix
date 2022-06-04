{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.exa = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.exa.enable {
    environment.systemPackages = with pkgs; [ exa ];
  };
}
