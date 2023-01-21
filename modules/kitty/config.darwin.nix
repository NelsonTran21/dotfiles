{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.kitty.enable {
  modules.homebrew.casks = [ "kitty" ];

  modules.home.file = {
    ".config/kitty/kitty.conf" = {
      source = ./kitty.conf;
    };

    ".config/kitty/mocha.conf" = {
      source = ./mocha.conf;
    };

    ".config/kitty/mocha-diff.conf" = {
      source = ./mocha-diff.conf;
    };
  };
}
