{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.ripgrep = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.ripgrep.enable {
    environment.systemPackages = with pkgs; [ ripgrep ];
  };
}
