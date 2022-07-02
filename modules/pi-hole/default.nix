{ config, lib, pkgs, ... }:

with lib;
{
  options.modules.pi-hole = with types; {
    enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.modules.pi-hole.enable {
    systemd.services.pi-hole =
      let
        docker = "${pkgs.docker}/bin/docker";
        composeFile = ./pi-hole.docker-compose.yml;
        dockerCompose = "${docker} compose -f ${composeFile}";
      in
      {
        enable = true;
        description = "Pi-hole";
        after = [ "docker.service" "network-online.target" ];
        requires = [ "docker.service" "network-online.target" ];
        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = "yes";
          WorkingDirectory = "/app/pi-hole";
          ExecStartPre = "${dockerCompose} pull";
          ExecStart = "${dockerCompose} up -d";
          ExecStop = "${dockerCompose} down";
          ExecReload = "${dockerCompose} pull && ${dockerCompose} up -d";
        };
      };
  };
}
