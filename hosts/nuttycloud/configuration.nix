{ inputs, config, lib, pkgs, isRescueSystem, ... }:

with lib;
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../modules/options.nix
    ../../modules/config.linux.nix
    ../../modules/config.nix
  ];

  system.stateVersion = "22.05";

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  # Allow unfree package installation.
  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "nuttycloud";
    hostId = "334a440a";

    # Network interface is manually renamed below.
    usePredictableInterfaceNames = false;

    # No need for DHCP. OVH gave us a static IP address.
    interfaces."rai-net".useDHCP = false;
    useDHCP = false;

    # 🔥 🔥 🔥 🔥 🔥
    firewall.enable = true;
  };

  systemd.network = {
    enable = true;

    # Because there are two network interfaces connected to this machine, let's
    # rename the network interface to avoid race conditions that would cause
    # eth0 and eth1 to flip names during device probing. El Psy Kongroo.
    links."10-rename-interface" = {
      matchConfig.MACAddress = "d0:50:99:fd:92:e3";
      linkConfig.Name = "rai-net";
    };

    networks."rai-net".extraConfig = ''
      [Match]
      Name = rai-net

      [Network]
      Address = 2604:2dc0:0200:17a5:0000:0000:0000:0000/64
      Gateway = 2604:2dc0:0200:17ff:00ff:00ff:00ff:00ff
      Address = 51.81.166.165/24
      Gateway = 51.81.166.254
    '';
  };

  boot.loader = mkIf (isRescueSystem != true) {
    grub.enable = true;
    grub.efiSupport = true;
    grub.mirroredBoots = [
      { devices = [ "nodev" ]; path = "/boot/ESP0"; }
      { devices = [ "nodev" ]; path = "/boot/ESP1"; }
    ];

    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/EFI";
  };

  # Use the latest kernel that is supported by ZFS.
  # https://discourse.nixos.org/t/package-zfs-kernel-2-0-5-5-14-5-is-marked-as-broken-refusing-to-evaluate/15139/5
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.supportedFilesystems = [ "zfs" ];
  environment.systemPackages = with pkgs; [ zfs ];

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
    rclone.enable = true;
    ripgrep.enable = true;
    ssh.enable = true;
    tldr.enable = true;
    vim.enable = true;
  };
}
