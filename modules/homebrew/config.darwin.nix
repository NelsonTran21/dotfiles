{ config, options, lib, ... }:

with lib;
mkIf config.modules.homebrew.enable {
  homebrew = {
    enable = true;
    autoUpdate = true;
    taps = modules.mkAliasDefinitions options.modules.homebrew.taps;
    brews = modules.mkAliasDefinitions options.modules.homebrew.brews;
    casks = modules.mkAliasDefinitions options.modules.homebrew.casks;
  };
}
