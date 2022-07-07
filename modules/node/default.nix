{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.node = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.node.enable {
    environment.systemPackages = with pkgs; [
      nodejs
      nodePackages.typescript
      yarn
    ];

    environment.variables = {
      NPM_CONFIG_USERCONFIG = "/home/${config.modules.home.user.name}/.config/npm/config";
      NPM_CONFIG_CACHE = "/home/${config.modules.home.user.name}/.config/npm";
      NPM_CONFIG_PREFIX = "/home/${config.modules.home.user.name}/npm";
      NODE_REPL_HISTORY = "/home/${config.modules.home.user.name}/node/repl_history";
    };
  };
}
