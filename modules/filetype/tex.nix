{
  pkgs,
  config,
  lib,
  ...
}: 
with builtins;
with lib;
let
  cfg = config.vim.filetype.tex;
  writeIf = cond: message: if cond then message else "";
in {
  options.vim.filetype.tex = {
    enable = mkEnableOption "Enable tex support through vimtex";
    ultisnipsEnable = mkEnableOption "Enable tex support through vimtex";
    ultisnipsSnippetDirectory = mkOption {
      type = types.str;
      description = "Directory where .snippet files are to be found";
    };
  };

  config = mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [
      (if cfg.enable then vimtex else null)
      (if cfg.ultisnipsEnable then ultisnips else null)
    ];
    vim.configRC = '' 
      let g:tex_flavor='latex'
      let g:vimtex_view_method='zathura'
      let g:vimtex_quickfix_mode=0
      set conceallevel=0
      " let g:tex_conceal='abdmg'
      let g:vimtex_include_search_enabled=0
      let g:vimtex_complete_close_braces=1
      let g:vimtex_view_forward_search_on_start=0
      let g:vimtex_complete_close_braces = 1
      let g:vimtex_view_automatic = 0
      let g:vimtex_indent_enabled=0
      let g:vimtex_compiler_method='latexmk'
      let g:vimtex_compiler_latexmk = {
          \ 'options' : [
          \   '-pdf',
          \   '-shell-escape',
          \   '-verbose',
          \   '-file-line-error',
          \   '-synctex=1',
          \   '-interaction=nonstopmode',
          \ ],
          \}
    ''; 
    vim.luaConfigRC = ''
      vim.g.UltiSnipsExpandTrigger = '<tab>'
      vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
      vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
      vim.g.UltiSnipsSnippetDirectories = {'${cfg.ultisnipsSnippetDirectory}'}
    '';
    };
}
