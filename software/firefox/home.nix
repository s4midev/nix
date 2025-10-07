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
        (import ./bookmarks.nix)
      ];
    };
  };
  config.programs.firefox.profiles.default.extensions.force = true;
}
