{
  config,
  lib,
  pkgs,
  ...
}: {
  config.programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
        # search
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.suggest.recentsearches" = false;

        # font config
        "font.name.monospace.x-western" = lib.mkForce "ComicShannsMono Nerd Font Mono";
        "font.name.sans-serif.x-western" = lib.mkForce "ComicShannsMono Nerd Font Mono";
        "font.name.serif.x-western" = lib.mkForce "ComicShannsMono Nerd Font Mono";
        "browser.display.use_document_fonts" = lib.mkForce 0;

        policies = {
          DisableTelemetry = true;
          DisableFirefoxStudies = true;
        };
      };
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          stylus
          firefox-color
          ublock-origin
          privacy-badger
          proton-pass
          proton-vpn
          i-dont-care-about-cookies
        ];
        settings."uBlock0@raymondhill.net".settings = {
          selectedFilterLists = [
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-unbreak"
            "ublock-quick-fixes"
            "easylist"
          ];
        };
      };
      bookmarks.force = true;

      bookmarks.settings = [
        {
          toolbar = true;
          bookmarks = [
            {
              name = "Jellyfin";
              url = "http://192.168.0.85:8096";
            }
            "separator"
            {
              name = "Arr";
              bookmarks = [
                {
                  name = "Radarr";
                  url = "http://192.168.0.85:7878";
                }
                {
                  name = "Sonarr";
                  url = "http://192.168.0.85:8989";
                }
                {
                  name = "Prowlarr";
                  url = "http://192.168.0.85:9696";
                }
                {
                  name = "Bazarr";
                  url = "http://192.168.0.85:6767";
                }
                {
                  name = "Lidarr";
                  url = "http://192.168.0.85:8686";
                }
                "separator"
                {
                  name = "qBittorrent";
                  url = "http://192.168.0.85:8090";
                }
                {
                  name = "SABnzbd";
                  url = "http://192.168.0.85:6789";
                }
              ];
            }
            "separator"
            {
              name = "Other Services";
              bookmarks = [
                {
                  name = "Proton Mail";
                  url = "https://mail.proton.me/u/1/inbox";
                }
              ];
            }
            "separator"
            {
              name = "Other Selfhosted";
              bookmarks = [
                {
                  name = "Unmanic";
                  url = "http://192.168.0.85:8888";
                }
                {
                  name = "Jellyseerr";
                  url = "http://192.168.0.85:5055";
                }
                {
                  name = "Pinchflat";
                  url = "http://192.168.0.85:8945";
                }
                {
                  name = "Romm";
                  url = "http://192.168.0.85:4077";
                }
              ];
            }
            "separator"
            {
              name = "Online";
              bookmarks = [
                {
                  name = "GitHub";
                  url = "https://github.com";
                }
                {
                  name = "Reddit";
                  url = "https://reddit.com";
                }
                {
                  name = "Whatsapp";
                  url = "https://web.whatsapp.com";
                }
              ];
            }
            "separator"
            {
              name = "Immich";
              url = "http://192.168.0.85:2283";
            }
            {
              name = "Karakeep";
              url = "http://192.168.0.85:3000";
            }
            {
              name = "Music";
              bookmarks = [
                {
                  name = "Koito";
                  url = "http://192.168.0.85:4110";
                }
                {
                  name = "slskd";
                  url = "http://192.168.0.85:5030";
                }
                {
                  name = "Navidrome";
                  url = "http://192.168.0.85:4533";
                }
              ];
            }
            "separator"
            {
              name = "Docs";
              bookmarks = [
                {
                  name = "Stylix";
                  url = "https://nix-community.github.io/stylix/";
                }
                {
                  name = "Home Manager";
                  url = "https://home-manager.dev/manual/23.11/options.xhtml";
                }
              ];
            }
          ];
        }
      ];
    };
  };
  config.programs.firefox.profiles.default.extensions.force = true;
}
