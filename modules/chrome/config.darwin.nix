{ config, lib, ... }:

with lib;
mkIf config.modules.chrome.enable {
  modules.homebrew.taps = [ "homebrew/cask-versions" ];
  modules.homebrew.casks = [
    "google-chrome-canary"
    "google-chrome"
  ];
}
