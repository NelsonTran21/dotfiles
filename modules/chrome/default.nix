{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.chrome = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.chrome.enable {
    modules.homebrew.casks = [ "google-chrome" ];
  };
}
