{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./vim-slime.nix
  ];
}
