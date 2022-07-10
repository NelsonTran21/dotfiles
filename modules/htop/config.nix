{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.htop.enable {
  environment.systemPackages = with pkgs; [ htop ];
}
