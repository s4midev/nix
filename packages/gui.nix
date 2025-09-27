{
  config,
  lib,
  pkgs,
  ...
}: {
  config.environment.systemPackages = with pkgs; [
    tela-icon-theme
    catppuccin-cursors.mochaDark
    catppuccin-gtk
  ];
}
