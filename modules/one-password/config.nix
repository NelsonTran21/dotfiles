{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.one-password.enable {
  environment.systemPackages = with pkgs; [ _1password ];
}
