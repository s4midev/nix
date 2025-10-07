{
  config,
  lib,
  pkgs,
  ...
}: {
  config.environment.systemPackages = with pkgs; [
    gnome-calendar
  ];

  # carbon copy of https://wiki.nixos.org/wiki/GNOME/Calendar
  config.programs.dconf.enable = true;
  config.services.gnome.evolution-data-server.enable = true;
  config.services.gnome.gnome-online-accounts.enable = true;
  config.services.gnome.gnome-keyring.enable = true;
}
