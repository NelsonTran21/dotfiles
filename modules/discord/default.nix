{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.discord = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.discord.enable {
    modules.homebrew.casks = [ "discord" ];
  };
}
