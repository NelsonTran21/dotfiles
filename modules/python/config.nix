{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.python.enable {
  environment.systemPackages = with pkgs; [
    python3
    poetry
  ];
}
