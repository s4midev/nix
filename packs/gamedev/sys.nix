{
  config,
  lib,
  pkgs,
  ...
}: {
  config.environment.systemPackages = with pkgs; [
    godot

    aseprite

    blender

    unityhub
  ];
}
