{ config, options, lib, pkgs, ... }:

with lib;
{
  options.modules.home = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };

    user = mkOption {
      type = attrs;
      default = { };
    };

    file = mkOption {
      type = attrs;
      default = { };
    };
  };

  config = mkIf config.modules.home.enable {
    modules.home.user = {
      name = "nelson";
      home = "/home/nelson";
      description = "Nelson Tran";
    };

    users.users.${config.modules.home.user.name} =
      modules.mkAliasDefinitions options.modules.home.user;

    home-manager = {
      useUserPackages = true;
      users.${config.modules.home.user.name} = {
        home = {
          username = config.modules.home.user.name;
          homeDirectory = "/home/${config.modules.home.user.name}";
          file = modules.mkAliasDefinitions options.modules.home.file;
          stateVersion = "22.05";
        };
      };
    };
  };
}
