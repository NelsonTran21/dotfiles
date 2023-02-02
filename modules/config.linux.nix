{ ... }:

{
  imports = [
    ./docker/config.linux.nix
    ./factorio/config.linux.nix
    ./home/config.linux.nix
    ./postgresql/config.linux.nix
    ./ssh/config.linux.nix
    ./tailscale/config.linux.nix
    ./tmux/config.linux.nix
  ];
}
