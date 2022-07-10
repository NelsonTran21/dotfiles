{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.rclone.enable {
  # Needed to mount remote filesystem over SFTP with `rclone mount`.
  modules.homebrew.casks = [ "macfuse" ];
}
