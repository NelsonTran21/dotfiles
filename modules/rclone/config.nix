{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.rclone.enable {
  environment.systemPackages = with pkgs; [ rclone ];

  # Needed to mount remote filesystem over SFTP with `rclone mount`.
  modules.homebrew.casks = [ "macfuse" ];
}
