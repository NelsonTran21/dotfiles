{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.tldr = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.tldr.enable {
    environment.systemPackages = with pkgs; [ tldr ];
  };
}
