{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.python = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.python.enable {
    environment.systemPackages = with pkgs; [
      python3
      poetry
    ];
  };
}
