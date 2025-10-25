{
  config,
  pkgs,
  ...
}: {
  config.home.file.".config/vesktop/settings.json".text = ''
    {
        "discordBranch": "stable",
        "minimizeToTray": true,
        "arRPC": true,
        "splashColor": "rgb(205, 214, 244)",
        "splashBackground": "rgb(30, 30, 46)",
        "spellCheckLanguages": [
            "en-US",
            "en"
        ]
    }
  '';

  # config.home.file.".config/vesktop/settings/settings.json".source = config.lib.file.mkOutOfStoreSymlink ./vesktop.json;

  config.home.file.".config/vesktop/state.json".text = ''
    {
        "firstLaunch": false,
        "windowBounds": {
            "x": 6,
            "y": 52,
            "width": 1908,
            "height": 1022
        },
        "displayId": 33,
        "maximized": true,
        "minimized": false,
        "vencordDir": "/run/media/sami/storage/Software/Vencord/dist"
    }
  '';
}
