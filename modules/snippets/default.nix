{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./ultisnips.nix
    ./vsnip.nix
  ];
}
