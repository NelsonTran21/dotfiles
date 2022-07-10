{ config, lib, ... }:

with lib;
mkIf config.modules.password.enable {
  modules.homebrew.casks = [ "1password" ];
}
