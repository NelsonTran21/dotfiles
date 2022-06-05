{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.fish = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.fish.enable {
    programs.fish.enable = true;
    programs.fish.shellInit =
      let
        sourceIf =
          isEnabled: path:
          optionals isEnabled [ "source ${path}" ];
      in
      concatStringsSep "\n" (
        sourceIf config.modules.exa.enable ../exa/init.fish ++
        sourceIf config.modules.homebrew.enable ../homebrew/init.fish ++
        sourceIf config.modules.macos.enable ../macos/init.fish
      );
  };
}
