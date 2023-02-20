{ config, lib, ... }:

with lib;
mkIf config.modules.dropbox.enable {
  modules.homebrew.casks = [ "dropbox" ];
}
