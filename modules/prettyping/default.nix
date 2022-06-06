{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.prettyping = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.prettyping.enable {
    environment.systemPackages = with pkgs; [ prettyping ];
  };
}
