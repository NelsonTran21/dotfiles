{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.fd.enable {
  environment.systemPackages = with pkgs; [ fd ];
}
