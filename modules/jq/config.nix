{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.jq.enable {
  environment.systemPackages = with pkgs; [ jq ];
}
