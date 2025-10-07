# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./imports/sys.nix
  ];

  # DO NOT CHANGE!! >:(
  system.stateVersion = "25.05";

  time.timeZone = "Europe/London";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;

  users.users.sami = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "libvirtd"];
  };

  programs.obs-studio.enable = true;

  programs.light.enable = true;

  nixpkgs.config.cudaSupport = true;

  programs.steam = {
    enable = true;
  };

  programs.gamemode.enable = true;

  services.openssh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.sami = import ./home.nix;
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = ["Comic Shanns Nerd Mono"];
      sansSerif = ["Comic Shanns Nerd Mono"];
      monospace = ["Comic Shanns Nerd Mono"];
      emoji = ["Twitter Color Emoji"];
    };
  };

  fonts.packages = with pkgs; [
    twemoji-color-font
    twitter-color-emoji
    nerd-fonts.comic-shanns-mono
  ];

  hardware.steam-hardware.enable = true;

  virtualisation.libvirtd.enable = true;

  programs.dconf.enable = true;

  programs.nix-ld.enable = true;

  powerManagement.cpuFreqGovernor = "performance";

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    extraConfig = {
      pipewire."92-low-latency" = {
        context.properties = {
          "default.clock.rate" = 96000;
          "default.clock.allowed-rates" = [96000 48000 44100];
          "default.clock.quantum" = 32;
          "default.clock.min-quantum" = 32;
          "default.clock.max-quantum" = 32;
        };
      };
    };
  };
}
