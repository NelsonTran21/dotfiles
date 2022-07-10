{ config, lib, ... }:

with lib;
mkIf config.modules.obsidian.enable {
  modules.homebrew.casks = [ "obsidian" ];
}
