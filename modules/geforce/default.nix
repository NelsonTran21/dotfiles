{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.geforce = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.geforce.enable {
    modules.homebrew.casks = [ "nvidia-geforce-now" ];
  };
}
