{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.fzf.enable {
  environment.systemPackages = with pkgs; [ fzf ];
}
