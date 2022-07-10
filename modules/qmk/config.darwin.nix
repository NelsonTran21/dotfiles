{ config, lib, ... }:

with lib;
mkIf config.modules.qmk.enable {
  modules.homebrew.taps = [ "homebrew/cask-drivers" ];
  modules.homebrew.casks = [ "qmk-toolbox" ];
}
