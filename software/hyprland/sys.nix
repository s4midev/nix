{
  config,
  lib,
  pkgs,
  ...
}: {
  config.environment.systemPackages = with pkgs; [
    hyprland
  ];

  config.programs.hyprlock.enable = true;
  config.programs.hyprland.enable = true;
  config.security.pam.services.hyprlock = {};
}
