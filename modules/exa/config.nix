{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.exa.enable {
  environment.systemPackages = with pkgs; [ exa ];
}
