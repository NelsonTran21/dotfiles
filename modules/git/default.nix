{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.git = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.git.enable {
    environment.systemPackages = with pkgs; [
      gitAndTools.delta
      gitAndTools.gitFull
      github-cli
    ];

    modules.home.file = {
      ".config/git/config" = {
        source = ./config;
      };
    };
  };
}
