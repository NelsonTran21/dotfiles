{ config, lib, ... }:

with lib;
mkIf config.modules.home.enable {
  modules.home.user = {
    group = "users";
    extraGroups = [ "wheel" ];
    isNormalUser = true;
  };
}
