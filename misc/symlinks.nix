{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  config.environment.etc = {
    ".local/share/osu".source = "/run/media/sami/games/Nix Save/osu";
    # ".local/share/Steam".source = "/run/media/sami/games/Steam";
    # ".steam".source = "/run/media/sami/games/Steam";
  };
}
