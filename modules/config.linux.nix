{ ... }:

{
  imports = [
    ./home/config.linux.nix
    ./ssh/config.linux.nix
    ./tailscale/config.linux.nix
  ];
}
