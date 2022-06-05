{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.fd = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.fd.enable {
    environment.systemPackages = with pkgs; [ fd ];
  };
}
