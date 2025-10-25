{
  config,
  lib,
  pkgs,
  ...
}: {
  config.environment.systemPackages = with pkgs; [
    # git
    git
    gitAndTools.gh

    # node
    nodejs
    pnpm
    bun

    # go
    go

    # python
    (python3.withPackages (ps: with ps; [build setuptools wheel]))

    # dotnet
    dotnet-sdk_9
    mono
    rustc

    #rust
    cargo
    rustfmt
    clippy
    rust-analyzer

    # base c
    gcc
    gnumake

    # nim
    nim
    nimble
  ];
}
