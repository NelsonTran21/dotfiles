{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.password.enable {
  environment.systemPackages = with pkgs; [ _1password ];
}
