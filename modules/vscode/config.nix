{ config, lib, ... }:

with lib;
mkIf config.modules.vscode.enable {
  modules.homebrew.casks = [ "visual-studio-code" ];

  modules.home.file = {
    "Library/Application Support/Code/User/settings.json" = {
      source = ./settings.json;
    };
  };
}
