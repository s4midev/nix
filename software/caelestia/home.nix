{
  config,
  pkgs,
  lib,
  ...
}: {
  # config.home.file.".config/caelestia/shell.json".source = config.lib.file.mkOutOfStoreSymlink ./shell.json;

  config.programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status = {
        showBattery = false;
      };

      appearance = {
        font = {
          family = {
            mono = "ComicShannsMono Nerd Font Mono";
            sans = "ComicShannsMono Nerd Font Mono";
          };
        };
      };

      bar.workspaces = {
        label = "";
        occupiedLabel = null;
        activeLabel = null;
        showWindows = false;
        perMonitorWorkspaces = false;
      };

      background = {
        desktopClock.enabled = true;
        visualiser.enabled = false;
      };

      border = {
        rounding = 10;
        thickness = 5;
      };

      services = {
        useFahrenheit = false;
        weatherLocation = "Sunderland, England";
        smartScheme = true;
      };

      utilities.toasts.capsLockChanged = false;

      paths.wallpaperDir = "/run/media/sami/storage/Walls";

      session.commands = {
        logout = ["loginctl" "terminate-user"];
        shutdown = null;
        hibernate = ["hyprlock"];
        reboot = null;
      };
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
