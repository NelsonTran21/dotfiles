{ lib, ... }:

with lib;
{
  options.modules.rclone = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
