{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.bat.enable {
  environment.systemPackages = with pkgs; [ bat ];
}
