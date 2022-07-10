{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.prettyping.enable {
  environment.systemPackages = with pkgs; [ prettyping ];
}
