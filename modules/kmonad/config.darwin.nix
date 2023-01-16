{ inputs, config, lib, pkgs, ... }:

with lib;
mkIf config.modules.kmonad.enable {
  # kmonad requires the driver-kit based extension to be installed in order to work:
  # https://github.com/kmonad/kmonad/blob/master/doc/installation.md#installing-the-kext
  environment.systemPackages = [ inputs.kmonad.packages.aarch64-darwin.kmonad ];
}
