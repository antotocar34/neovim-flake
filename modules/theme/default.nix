{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./theme.nix
    ./config.nix
    ./supportedThemes.nix
  ];
}
