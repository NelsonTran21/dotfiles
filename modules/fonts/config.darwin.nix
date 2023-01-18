{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.fonts.enable {
  modules.homebrew.taps = [ "homebrew/cask-fonts" ];
  modules.homebrew.casks = [
       "font-iosevka"
       "font-jetbrains-mono"
  ];
}
