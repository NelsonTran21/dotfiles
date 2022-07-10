{ config, lib, ... }:

with lib;
mkIf config.modules.logitech.enable {
  modules.homebrew.taps = [ "homebrew/cask-drivers" ];
  modules.homebrew.casks = [ "logitech-options" ];
}
