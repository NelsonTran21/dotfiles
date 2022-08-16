{ config, pkgs, ... }:

{
  config = {
    boot.kernelParams = [ "amd_iommu=on" "pcie_aspm=off" "hugepagesz=2MB" "hugepages=16768" ];
    boot.kernelModules = [ "kvm-amd" ];

    boot.initrd.availableKernelModules = [ "amdgpu" "vfio-pci" ];
    boot.initrd.preDeviceCommands = ''
      # Load VFIO driver for the 3080 GPU (guest)
      echo "vfio-pci" > /sys/bus/pci/devices/0000:05:00.0/driver_override
      echo "vfio-pci" > /sys/bus/pci/devices/0000:05:00.1/driver_override
      modprobe -i vfio-pci
    '';

    environment.systemPackages = with pkgs; [
      looking-glass-client
      scream
      virtmanager
    ];

    systemd.tmpfiles.rules = [
      "f /dev/shm/looking-glass 0660 ${config.modules.home.user.name} qemu-libvirtd -"
      "f /dev/shm/scream 0660 ${config.modules.home.user.name} qemu-libvirtd -"
    ];

    virtualisation.libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
      qemu.ovmf.package = pkgs.OVMFFull;
      qemu.swtpm.enable = true;
      qemu.runAsRoot = false;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };

    environment.variables = {
      # Ensure virsh uses the same connection URI as virt-manager
      LIBVIRT_DEFAULT_URI = "qemu:///system";
    };

    modules.home.user.extraGroups = [ "libvirtd" ];

    networking.firewall.allowedTCPPorts = [ 4010 ];
    networking.firewall.allowedUDPPorts = [ 4010 ];

    systemd.user.services.scream = {
      enable = true;
      description = "Scream";
      serviceConfig = {
        ExecStart = "${pkgs.scream}/bin/scream -o pulse -i virbr0";
        Restart = "always";
      };
      wantedBy = [ "multi-user.target" ];
      requires = [ "pulseaudio.service" ];
    };
  };
}
