{ inputs, config, lib, pkgs, modulesPath, ... }:

with lib;
let
  nixos-wsl = import ./nixos-wsl;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../modules/options.nix
    ../../modules/config.linux.nix
    ../../modules/config.nix

    "${modulesPath}/profiles/minimal.nix"
    nixos-wsl.nixosModules.wsl
  ];

  system.stateVersion = "22.05";

  time.timeZone = "America/Phoenix";

  networking = {
    hostName = "nuttytower";
  };

  wsl = {
    enable = true;
    automountPath = "/mnt";
    defaultUser = "nixos";
    startMenuLaunchers = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;

  };

  # Enable nix flakes
  nix.package = pkgs.nixVersions.stable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  modules = {
    bat.enable = true;
    exa.enable = true;
    fd.enable = true;
    fish.enable = true;
    fzf.enable = true;
    git.enable = true;
    home.enable = true;
    htop.enable = true;
    prettyping.enable = true;
    ripgrep.enable = true;
    ssh.enable = true;
    tldr.enable = true;
    tmux.enable = true;
    vim.enable = true;
  };
}
