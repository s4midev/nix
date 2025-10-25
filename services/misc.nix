{
  config,
  lib,
  pkgs,
  ...
}: {
  config.hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  config.services.blueman.enable = true;

  # Network
  config.networking = {
    networkmanager.enable = true;
    firewall.enable = false;
    hostName = "nixos";
  };

  config.virtualisation.docker.enable = true;

  config.security.sudo.extraRules = [
    {
      users = ["sami"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  config.services.flatpak.enable = true;
  config.programs.gpu-screen-recorder.enable = true;

  # xbox controller support
  config.hardware.xone.enable = true;

  config.services.udisks2.enable = true;
}
