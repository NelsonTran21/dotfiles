{ config, lib, ... }:

with lib;
mkIf config.modules.iosevka.enable {
  modules.homebrew.taps = [ "homebrew/cask-fonts" ];
  modules.homebrew.casks = [ "font-iosevka" ];
}
