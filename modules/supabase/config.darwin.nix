{ config, lib, ... }:

with lib;
mkIf config.modules.supabase.enable {
  modules.homebrew.taps = [ "supabase/homebrew-tap" ];
  modules.homebrew.brews = [ "supabase" ];
}
