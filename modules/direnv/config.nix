{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.direnv.enable {
  environment.systemPackages = with pkgs; [ direnv ];

  modules.home.file = {
    ".config/direnv/direnv.toml" = {
      source = ./direnv.toml;
    };
  };
}
