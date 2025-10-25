{
  config,
  lib,
  pkgs,
  ...
}: {
  config.environment.systemPackages = with pkgs; [
    # Visualise Folders
    tree

    # System Info
    fastfetch

    # Proton Installer
    protonup

    # Usage Dashboard
    btop

    # unzip
    unzip

    # moo
    cowsay

    # JSON pretty-printer and query toolkit
    jq

    # smart
    smartmontools

    # steam grid db
    sgdboop

    # ripper for many services
    yt-dlp

    # CLI Speed Test
    speedtest-cli

    # 7z
    p7zip

    # Mime Type Determiner
    file

    # Multimedia Toolkit
    ffmpeg
  ];
}
