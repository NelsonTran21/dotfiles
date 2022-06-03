{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.password = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.password.enable {
    environment.systemPackages = with pkgs; [ _1password ];
    modules.homebrew.casks = [ "1password" ];
  };
}
