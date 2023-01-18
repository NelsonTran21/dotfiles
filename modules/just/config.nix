{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.just.enable {
  environment.systemPackages = with pkgs; [ just ];
}
