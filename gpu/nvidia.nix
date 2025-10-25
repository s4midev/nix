{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./common.nix
  ];

  config.hardware.nvidia.open = true;
  config.hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  config.services.xserver.videoDrivers = ["nvidia"];

  config.hardware.nvidia-container-toolkit.enable = true;

  config.environment.systemPackages = with pkgs; [
    cudatoolkit
    nv-codec-headers
  ];
}
