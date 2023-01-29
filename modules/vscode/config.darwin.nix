{ config, lib, ... }:

with lib;
mkIf config.modules.vscode.enable {
  modules.homebrew.casks = [ "visual-studio-code" ];

  # [NOTE] Prefer to manually symlink link VSCode settings to the dotfiles
  # repository instead of linking them directly to the Nix store. Extensions
  # that I use modify settings often enough that the EACCES permission errors
  # that pop up are driving me crazy.
}
