{ config, lib, ... }:

with lib;
mkIf config.modules.one-password.enable {
  modules.homebrew.casks = [ "1password" ];
}
