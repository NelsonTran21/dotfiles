{ config, lib, ... }:

with lib;
mkIf config.modules.postgresql.enable {
  modules.homebrew.brews = [ "postgresql" ];
}
