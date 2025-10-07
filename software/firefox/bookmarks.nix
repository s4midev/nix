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
          name = "Romm";
          url = "http://192.168.0.85:4077";
        }
        {
          name = "NextCloud";
          url = "https://";
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
      url = "https://karakeep.s4mi.gay";
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
