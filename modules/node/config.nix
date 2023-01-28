{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.node.enable {
  environment.systemPackages = with pkgs; [
    bun
    nodejs
    nodePackages.eslint
    nodePackages.pnpm
    nodePackages.typescript
    nodePackages.typescript-language-server
    yarn
  ];
}
