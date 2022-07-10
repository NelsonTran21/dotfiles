{ config, lib, ... }:

with lib;
mkIf config.modules.jetbrains.enable {
  modules.homebrew.casks = [
    "datagrip"
    "rider"
    "webstorm"
  ];
}
