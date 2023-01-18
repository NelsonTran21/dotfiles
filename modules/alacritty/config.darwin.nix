{ inputs, config, lib, pkgs, ... }:

with lib;
mkIf config.modules.alacritty.enable {
  # Gatekeeper will not allow alacritty to run because it has not been notarized.
  # As a workaround, run `xattr -rd com.apple.quarantine /Applications/Alacritty.app`
  modules.homebrew.casks = [ "alacritty" ];

  modules.home.file = {
    ".config/alacritty/alacritty.yml" = {
      source = ./alacritty.yml;
    };
  };
}
