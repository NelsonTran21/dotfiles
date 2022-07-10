{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.postgresql.enable {
  environment.systemPackages = with pkgs; [
    pgcli
    pgformatter
  ];

  modules.homebrew.brews = [ "postgresql" ];
}
