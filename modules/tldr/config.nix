{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.tldr.enable {
  environment.systemPackages = with pkgs; [ tldr ];
}
