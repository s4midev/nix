{
  config,
  lib,
  pkgs,
  ...
}: {
  config.environment.systemPackages = with pkgs; [
    # Terminal
    kitty

    # Volume Control
    pavucontrol

    # File Manager
    nemo-with-extensions
    nemo-fileroller

    # System Monitor
    gnome-system-monitor

    # Media Player
    vlc

    # hypr*
    hyprshot
    hyprsunset
    hyprpicker
    hyprpolkitagent

    # Image Viewer
    eog

    # Storage Usage Visualiser
    baobab

    # Video Trimmer
    video-trimmer

    # Jellyfin Client
    delfin

    vesktop

    # catppuccinifier
    catppuccinifier-cli

    # Screen Recorder
    gpu-screen-recorder-gtk

    # VM Manager
    gnome-boxes

    # Bluetooth Connection Manager
    blueberry

    # FOSS Photo Editor
    gimp3

    # BitTorrent Client
    qbittorrent

    # come on, everybody knows what mpv is :3
    mpv

    # Music Streaming Service
    spotify

    # Audio Editor
    tenacity

    # Windows Compat Layer
    wine64
    wine

    # Ebook Client
    foliate

    # Auto Disk Mount
    udiskie

    # Bottles
    bottles

    xfce.mousepad
    libreoffice
  ];
}
