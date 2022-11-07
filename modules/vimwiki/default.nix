{
  pkgs,
  config,
  lib,
  ...
}: 
with builtins;
with lib;
let
  cfg = config.vim.vimwiki;
  writeIf = cond: message: if cond then message else "";
in {

  options.vim.vimwiki = {
    enable = mkEnableOption "Enable vimwiki";
    wikiPath = mkOption {
      type = types.str;
    };
  };

  config = mkIf cfg.enable {
      vim.startPlugins = with pkgs.neovimPlugins; [vimwiki];
      vim.configRC = ''
      let g:vimwiki_list = [{'path': "${cfg.wikiPath}"}]
      let g:vimwiki_global_ext = 0 " Make sure vimwiki doesn't affect markdown files.
        '';
  };
}

