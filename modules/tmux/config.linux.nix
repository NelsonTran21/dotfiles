{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.tmux.enable {
  # This is useful for re-parenting long running processes under tmux.
  # It allows you to close a terminal window or an SSH session without
  # needing to kill the process.
  environment.systemPackages = with pkgs; [ reptyr ];
}
