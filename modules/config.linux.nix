{ ... }:

{
  imports = [
    ./caddy/config.linux.nix
    ./docker/config.linux.nix
    ./factorio/config.linux.nix
    ./footcards/config.linux.nix
    ./home/config.linux.nix
    ./postgresql/config.linux.nix
    ./ssh/config.linux.nix
    ./tailscale/config.linux.nix
    ./tmux/config.linux.nix
  ];
}
