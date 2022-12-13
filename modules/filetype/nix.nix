{
  pkgs,
  config,
  lib,
  ...
}:
with builtins;
with lib; let
  cfg = config.vim.filetype.nix;
  writeIf = cond: message:
    if cond
    then message
    else "";
in {
  options.vim.filetype.nix = {
    enable = mkEnableOption "Enable nix support through vim-nix";
  };

  config = mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [ vim-nix ];
  };
}
