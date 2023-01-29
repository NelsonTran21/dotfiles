{ config, lib, ... }:

with lib;
mkIf config.modules.vscode.enable {
  # [HACK] Disabling VSCode installation via homebrew module because versions
  # 1.74 breaks support for the Customize UI and Monkey Patch extensions that I
  # use to customize the look and feel of VSCode. Pinning my installation to
  # 1.73 for the unforeseeable future, or until the breaking changes are
  # reverted by the VSCode team.

  # modules.homebrew.casks = [ "visual-studio-code" ];

  # [NOTE] Prefer to manually symlink link VSCode settings to the dotfiles
  # repository instead of linking them directly to the Nix store. Extensions
  # that I use modify settings often enough that the EACCES permission errors
  # that pop up are driving me crazy.
}
