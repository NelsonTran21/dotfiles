{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.rust.enable {
  environment.systemPackages = with pkgs; [
    rust-analyzer
    rustup
  ];
}
