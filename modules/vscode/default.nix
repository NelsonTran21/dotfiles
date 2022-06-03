{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.vscode = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.vscode.enable {
    modules.homebrew.casks = [ "visual-studio-code" ];

    modules.home.file = {
      "Library/Application Support/Code/User/settings.json" = {
        source = ./settings.json;
      };
    };
  };
}
