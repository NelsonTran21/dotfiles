{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "ssd/root";
      fsType = "zfs";
    };

  fileSystems."/home" =
    {
      device = "ssd/home";
      fsType = "zfs";
    };

  fileSystems."/boot/ESP0" =
    {
      device = "/dev/disk/by-uuid/C83C-ABFD";
      fsType = "vfat";
    };

  fileSystems."/boot/ESP1" =
    {
      device = "/dev/disk/by-uuid/CADC-0530";
      fsType = "vfat";
    };

  swapDevices = [ ];

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
