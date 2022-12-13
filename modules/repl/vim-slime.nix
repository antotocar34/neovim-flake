{
  pkgs,
  config,
  lib,
  ...
}:
with builtins;
with lib; let
  cfg = config.vim.repl.vim-slime;
  writeIf = cond: message:
    if cond
    then message
    else "";
in {
  options.vim.repl.vim-slime = {
    enable = mkEnableOption "Enable vim-slime";
  };

  config = mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [ vim-slime ];

    vim.configRC = ''
      let g:slime_target = "neovim"
      let g:slime_python_ipython = 1
      vnoremap R :SlimeSend<CR>
      nnoremap R :SlimeSend<CR>j
    '';
  };
}

