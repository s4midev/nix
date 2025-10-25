{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./imports/home.nix
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 24;
  };

  home.username = "sami";
  home.homeDirectory = "/home/sami";

  home.stateVersion = "25.05";

  gtk = {
    cursorTheme = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "Catppuccin Mocha Dark";
    };
    enable = true;
  };

  catppuccin = {
    enable = false;
    obs.enable = true;
    gtk.icon.enable = true;
  };

  stylix.fonts = {
    sansSerif = {
      name = "ComicShannsMono Nerd Font Mono";
      package = pkgs.nerd-fonts.comic-shanns-mono;
    };
    monospace = {
      name = "ComicShannsMono Nerd Font Mono";
      package = pkgs.nerd-fonts.comic-shanns-mono;
    };
    serif = {
      name = "ComicShannsMono Nerd Font Mono";
      package = pkgs.nerd-fonts.comic-shanns-mono;
    };
  };

  # softwares :P
  programs.kitty = {
    enable = true;
    extraConfig = ''
      confirm_os_window_close 0
      background_opacity 1
      background_blur 0
      window_padding_width 4 4 4 8
    '';
    environment = {
      "IMMICH_INSTANCE_URL" = "http://192.168.0.85:2283";
      "IMMICH_API_KEY" = "61mwmSJWw1mQB0I9U6YckGgVMTjwRIAVdu7rgawcQ";
    };
  };

  services.udiskie = {
    enable = true;

    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
      };
    };
  };

  programs.hyprpanel.enable = true;

  programs.wofi.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = [
      pkgs.obs-studio-plugins.wlrobs
    ];
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "stylix";
      theme_background = false;
    };
  };

  dconf.settings = {
    "org/cinnamon/desktop/applications/terminal" = {
      exec = "kitty";
      exec-arg = "-e";
    };
    "org/cinnamon/desktop/default-applications/terminal" = {
      exec = "kitty";
      exec-arg = "-e";
    };
  };

  services.easyeffects = {
    enable = true;
  };
}
