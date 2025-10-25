{
  config,
  pkgs,
  ...
}: {
  config.home.file."wofi/config/config".source = config.lib.file.mkOutOfStoreSymlink ./config;
  config.home.file."wofi/src/mocha/style.css".source = config.lib.file.mkOutOfStoreSymlink ./style.css;
}
