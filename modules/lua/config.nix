{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.lua.enable {
  environment.systemPackages = with pkgs; [ lua5_4 ];
}
