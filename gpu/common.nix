{
  config,
  lib,
  pkgs,
  ...
}: {
  config.hardware.graphics.enable32Bit = true;
  config.hardware.graphics.enable = true;
}
