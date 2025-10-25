{
  config,
  lib,
  pkgs,
  ...
}: {
  config.environment.systemPackages = with pkgs; [
    # X
    xorg.libX11

    # Alejandra VSCode
    alejandra

    # Media Controller
    playerctl

    # 2D Graphics Lib
    cairo

    # ?
    fuse

    # network fs
    gvfs

    # deps for appimages, but it doesn't really help
    fuse
    fuse3

    # clipboard copier for wayland
    wl-clipboard

    # immich cli
    immich-cli

    # Required for some things like nemo
    cinnamon-common
    
    icu

    ddcutil
  ];
}
