{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.firmware = [pkgs.linux-firmware];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = ["kvm-intel" "kvm-amd"];
  boot.kernelParams = [
    "iommu=pt"
    "amd_iommu=on"
    "vfio-pci.ids=10de:1e81,10de:10f8,10de:1ad8,10de:1ad9"
  ];

  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS";
    fsType = "ext4";
  };

  fileSystems."/run/media/sami/media" = {
    device = "/dev/disk/by-label/Media";
    fsType = "ext4";
    options = ["defaults" "x-gvfs-name=Media"];
  };
  fileSystems."/run/media/sami/storage" = {
    device = "/dev/disk/by-label/Storage";
    fsType = "ext4";
    options = ["defaults" "x-gvfs-name=Storage"];
  };
  fileSystems."/run/media/sami/games" = {
    device = "/dev/disk/by-label/Games";
    fsType = "ext4";
    options = ["defaults" "x-gvfs-name=Games"];
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
