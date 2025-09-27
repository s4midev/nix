{
  config,
  lib,
  pkgs,
  ...
}: {
  config.environment.systemPackages = with pkgs; [
    # osu!
    osu-lazer-bin

    # Minecraft
    prismlauncher

    # Nintendo Switch
    ryubing

    # modding tool
    r2modman
  ];
}
