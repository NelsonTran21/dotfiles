{ config, lib, ... }:

with lib;
mkIf config.modules.figma.enable {
  modules.homebrew.casks = [ "figma" ];
}
