{ inputs, config, pkgs, ... }:

let
  wifiPassword = "e786ddb36c4864f3b95a5bbca4ab91e12b4555531fd69b7dbb10ab082d345e3b";
  userPassword = "$6$SdzEEj7pMDAzRmT9$S.gFAPBbk3O7MsOfgBLlTmy3KraFDSCqMU21DQiQVxOxGICnIdJREMI/kO.w1TRnPxlj/LBdcHZszOu2TBn4C/";
in
{
  imports = [
    inputs.hardware.nixosModules.raspberry-pi-4
    inputs.home-manager.nixosModules.home-manager
    ../../modules/options.nix
    ../../modules/config.linux.nix
    ../../modules/config.nix
  ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking = {
    hostName = "nuttyberry";
    wireless = {
      enable = true;
      networks.CentralPerk.pskRaw = wifiPassword;
      interfaces = [ "wlan0" ];
    };
  };

  users = {
    mutableUsers = false;
    users.nelson = {
      isNormalUser = true;
      hashedPassword = userPassword;
      extraGroups = [ "wheel" ];
    };
  };

  # Enable GPU acceleration
  hardware.raspberry-pi."4".fkms-3d.enable = true;

  hardware.pulseaudio.enable = true;

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
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
    jq.enable = true;
    prettyping.enable = true;
    rclone.enable = true;
    ripgrep.enable = true;
    ssh.enable = true;
    tailscale.enable = true;
    tldr.enable = true;
    vim.enable = true;
  };
}
