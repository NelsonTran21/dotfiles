{ config, lib, ... }:

with lib;
mkIf config.modules.discord.enable {
  modules.homebrew.casks = [ "discord" ];
}
