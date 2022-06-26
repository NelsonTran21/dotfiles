{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.vim = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.vim.enable {
    environment.systemPackages = [
      (pkgs.callPackage ./vimPackage.nix { })
    ];

    modules.home.file = {
      ".config/nvim/lua" = {
        source = ./config;
        recursive = true;
      };
    };

    environment.variables = {
      EDITOR = "nvim";
    };
  };
}
