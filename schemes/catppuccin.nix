{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  config.stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./catppuccin.png;

    targets = {
      gtk.enable = true;
      nixcord.enable = false;
      vscode.enable = false;
      gnome.enable = true;

      hyprlock.enable = true;

      hyprpaper = {
        enable = true;
      };

      firefox = {
        enable = true;
        profileNames = ["default"];
        colorTheme.enable = true;
      };
    };
  };

  config.programs.vscode.profiles.default.extensions = [
    pkgs.vscode-extensions.catppuccin.catppuccin-vsc
  ];

  config.programs.vscode.profiles.default.userSettings."workbench.colorTheme" = "Catppuccin Mocha";

  config.home.file."/home/sami/.config/vesktop/settings/quickCss.css".text = ''
    @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-mauve.theme.css");

    :root {
        --font-primary: "ComicShannsMono Nerd Font Mono";
        --font-display: "ComicShannsMono Nerd Font Mono";
        --font-headline: "ComicShannsMono Nerd Font Mono";
        --font-code: "ComicShannsMono Nerd Font Mono";
    }
  '';
}
