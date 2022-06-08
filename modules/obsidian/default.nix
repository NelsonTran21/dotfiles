{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.obsidian = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.obsidian.enable {
    modules.homebrew.casks = [ "obsidian" ];
  };
}
