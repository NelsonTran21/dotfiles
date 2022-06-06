{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.jq = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.jq.enable {
    environment.systemPackages = with pkgs; [ jq ];
  };
}
