{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.fzf = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.fzf.enable {
    environment.systemPackages = with pkgs; [ fzf ];
  };
}
