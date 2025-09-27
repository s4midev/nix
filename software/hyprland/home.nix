{
  config,
  lib,
  pkgs,
  ...
}: {
  home.file.".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland.conf;
}
