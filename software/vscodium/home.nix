{
  config,
  lib,
  pkgs,
  ...
}: {
  config.programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;

    profiles.default = {
      extensions = [
        pkgs.vscode-extensions.bbenoist.nix
        pkgs.vscode-extensions.kamadorueda.alejandra
        pkgs.vscode-extensions.esbenp.prettier-vscode
        pkgs.vscode-extensions.golang.go
        pkgs.vscode-extensions.adpyke.codesnap
        pkgs.vscode-extensions.ms-dotnettools.csharp
        pkgs.vscode-extensions.ms-dotnettools.vscode-dotnet-runtime
        pkgs.vscode-extensions.esbenp.prettier-vscode
        pkgs.vscode-extensions.rust-lang.rust-analyzer
      ];
      userSettings = {
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[csharp]" = {
          "editor.defaultFormatter" = "ms-dotnettools.csharp";
        };
        "editor.fontFamily" = "ComicShannsMono Nerd Font Mono";
        "terminal.integrated.fontFamily" = "ComicShannsMono Nerd Font Mono";
      };
    };
  };
}
