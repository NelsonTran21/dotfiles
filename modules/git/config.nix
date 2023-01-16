{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.git.enable {
  environment.systemPackages = with pkgs; [
    gitAndTools.delta
    gitAndTools.gitFull
    github-cli
    lazygit
  ];

  modules.home.file = {
    ".config/git/config" = {
      source = ./config;
    };
  };
}
