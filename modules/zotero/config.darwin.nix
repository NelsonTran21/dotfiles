{ config, lib, ... }:

with lib;
mkIf config.modules.zotero.enable {
  modules.homebrew.casks = [ "zotero" ];
}
