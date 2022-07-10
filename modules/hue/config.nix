{ config, lib, ... }:

with lib;
mkIf config.modules.hue.enable {
  modules.homebrew.taps = [ "homebrew/cask-drivers" ];
  modules.homebrew.casks = [ "philips-hue-sync" ];
}
