{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.docker = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.docker.enable {
    virtualisation.docker.enable = true;
  };
}
