{ lib, ... }:

with lib;
{
  options.modules.supabase = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };
}
