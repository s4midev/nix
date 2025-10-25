{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Hardware
    ../hardware/server.nix
    # ../hardware/laptop.nix

    # GPU
    ../gpu/nvidia.nix
    # ../gpu/amd.nix

    # Misc Services Configuration, Very Messy
    ../services/misc.nix

    # CLI Tools
    ../packages/cli.nix

    # Required Softwares
    ../packages/software.nix

    # Mostly Just Icon Deps
    ../packages/gui.nix

    # Misc Deps For Softwares
    ../packages/deps.nix

    # Non Steam Games
    ../packages/games.nix

    # Programming Deps
    ../packages/programming.nix

    # Tiling WM
    ../software/hyprland/sys.nix

    # Vesktop (Custom Discord Client)
    ../software/vesktop/sys.nix

    ../software/vr/sys.nix

    # Game Development Pack
    ../packs/gamedev/sys.nix
  ];
}
