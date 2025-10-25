{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Firefox Browser
    ../software/firefox/home.nix

    # Vesktop (Custom Discord Client)
    ../software/vesktop/home.nix

    # VSCodium (FOSS VSCode Fork)
    ../software/vscodium/home.nix

    # Caelestia Shell
    ../software/caelestia/home.nix

    # Hyprland (Tiling Window Manager)
    ../software/hyprland/home.nix

    ../schemes/catppuccin.nix
  ];
}
