{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.rclone.enable {
  environment.systemPackages = with pkgs; [ rclone ];
}
