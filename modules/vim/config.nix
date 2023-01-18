{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.vim.enable {
  environment.systemPackages = [
    (pkgs.callPackage ./vimPackage.nix { })
    pkgs.tree-sitter
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
}
