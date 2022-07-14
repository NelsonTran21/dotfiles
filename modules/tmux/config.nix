{ config, lib, pkgs, ... }:

with lib;
mkIf config.modules.tmux.enable {
  environment.systemPackages = with pkgs; [ tmux ];

  modules.home.file = {
    ".config/tmux/tmux.conf" =
      let
        tmuxConfig = [ (readFile ./tmux.conf) ];
        fishConfig = [ "set -g default-command ${pkgs.fish}/bin/fish" ];
      in
      {
        text = concatStringsSep "\n" (
          tmuxConfig ++
          optionals config.modules.fish.enable fishConfig
        );
      };
  };
}
