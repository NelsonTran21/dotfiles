{ config, lib, ... }:

with lib;
mkIf config.modules.chrome.enable {
  modules.homebrew.casks = [ "google-chrome" ];
}
