{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.node.enable {
  environment.systemPackages = with pkgs; [
    bun
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    yarn
  ];
}
