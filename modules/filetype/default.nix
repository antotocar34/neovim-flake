{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./tex.nix
    ./nix.nix
  ];
}
