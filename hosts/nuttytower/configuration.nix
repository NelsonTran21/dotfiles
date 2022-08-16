{ inputs, config, lib, pkgs, ... }:

with lib;
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../modules/options.nix
    ../../modules/config.linux.nix
    ../../modules/config.nix
  ];

  time.timeZone = "America/Phoenix";

  system.stateVersion = "22.05";

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  # Allow unfree package installation.
  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "nuttytower";
    hostId = "189d8ce8";
  };

  networking.useDHCP = false;
  networking.interfaces.enp7s0.useDHCP = true;
  networking.interfaces.wlp6s0.useDHCP = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "zfs" ];
  boot.initrd.supportedFilesystems = [ "zfs" ];
  environment.systemPackages = with pkgs; [ zfs ];

  # Use the latest kernel that is supported by ZFS.
  # https://discourse.nixos.org/t/package-zfs-kernel-2-0-5-5-14-5-is-marked-as-broken-refusing-to-evaluate/15139/5
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  modules = {
    bat.enable = true;
    exa.enable = true;
    fd.enable = true;
    fish.enable = true;
    fzf.enable = true;
    git.enable = true;
    home.enable = true;
    htop.enable = true;
    obsidian.enable = true;
    prettyping.enable = true;
    ripgrep.enable = true;
    ssh.enable = true;
    tailscale.enable = true;
    tldr.enable = true;
    tmux.enable = true;
    vim.enable = true;
  };
}
