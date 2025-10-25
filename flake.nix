{
  description = "read if cute";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
    };
    catppuccin.url = "github:catppuccin/nix";
    nixcord.url = "github:kaylorben/nixcord";
    nur.url = "github:nix-community/NUR";
    stylix.url = "github:nix-community/stylix";

    millennium.url = "git+https://github.com/SteamClientHomebrew/Millennium?ref=next";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    caelestia-shell = {
      url = "github:s4midev/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    stylix,
    nixcord,
    nur,
    millennium,
    catppuccin,
    spicetify-nix,
    caelestia-shell,
    ...
  }: {
    nixosConfigurations = {
      extra-substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./configuration.nix
          spicetify-nix.nixosModules.default
          ({pkgs, ...}: {
            nixpkgs.overlays = [
              millennium.overlays.default
            ];
            environment.systemPackages = [];
            # programs.steam.package = pkgs.steam-millennium;
          })

          home-manager.nixosModules.home-manager
          {
            home-manager.sharedModules = [
              catppuccin.homeModules.catppuccin
              caelestia-shell.homeManagerModules.default
              nixcord.homeModules.nixcord
              stylix.homeModules.stylix
              spicetify-nix.homeManagerModules.default
            ];

            programs.spicetify = let
              spicePkgs = spicetify-nix.legacyPackages.x86_64-linux;
            in {
              enable = true;
              theme = spicePkgs.themes.catppuccin;
              colorScheme = "mocha";
              enabledExtensions = with spicePkgs.extensions; [
                adblock
                hidePodcasts
                shuffle
                beautifulLyrics
              ];
              enabledCustomApps = with spicePkgs.apps; [
                newReleases
                nameThatTune
                lyricsPlus
              ];
            };
          }
          nur.modules.nixos.default
          stylix.nixosModules.stylix
          catppuccin.nixosModules.catppuccin
        ];
      };
    };
  };
}
