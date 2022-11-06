{
  pkgs,
  config,
  lib,
  ...
}: 
with lib;
with builtins;
let
  cfg = config.vim.vim-floaterm;
  writeIf = cond: message: if cond then message else "";
in {
  options.vim.vim-floaterm = {
    enable = mkEnableOption "Add support for Toggle terminals";
  };

  config =
    mkIf (cfg.enable)
    {
      vim.startPlugins = with pkgs.neovimPlugins; [vim-floaterm];

      vim.nnoremap = {
        "¬" = "<cmd>FloatermToggle<CR>";
        "<F3>" = "<cmd>FloatermHide<CR><cmd>FloatermPrev<CR>";
        "<F4>" = "<cmd>FloatermHide<CR><cmd>FloatermNext<CR>";
        "<leader>]" = "<cmd>FloatermNew --wintype=vsplit --width=90<CR>";
        "<leader>[" = "<cmd>FloatermNew --wintype=split --height=15<CR>";
      };

      vim.tnoremap = {
        "<F3>" = "<cmd>FloatermHide<CR><cmd>FloatermPrev<CR>";
        "<F4>" = "<cmd>FloatermHide<CR><cmd>FloatermNext<CR>";
        "¬" = "<cmd>FloatermToggle<CR>";
        "<leader>]" = "<cmd>FloatermNew --wintype=vsplit --width=90<CR>";
        "<leader>[" = "<cmd>FloatermNew --wintype=split --height=15<CR>";
      };

      vim.configRC = ''
        ${ writeIf (config.vim.theme.name == "nord") ''
        au TermOpen * hi! NormalFloat guibg='#2E3440'
        hi FloatermBorder guifg='#81A1C1'
        ''
        }
        au TermOpen * setlocal nonumber norelativenumber
        au TermOpen * startinsert
        au TermEnter * echo "jobid: ". &channel
        nnoremap + <cmd>FloatermNew --wintype=float --width=220 --height=60<CR>
        tnoremap <C-q> <C-\><C-N><cmd>FloatermKill<CR>

        tnoremap <C-w>h <C-\><C-N><C-w>h
        tnoremap <C-w>j <C-\><C-N><C-w>j
        tnoremap <C-w>k <C-\><C-N><C-w>k
        tnoremap <C-w>l <C-\><C-N><C-w>l

        " tunmap <tab>
        tnoremap <C-k>[ <C-\><C-n><CR>

        " Auto insert into the terminal
        let g:previous_window = -1
        function SmartInsert()
          if &buftype == 'terminal'
            if g:previous_window != winnr()
              startinsert
            endif
            let g:previous_window = winnr()
          else
            let g:previous_window = -1
          endif
        endfunction

        au BufEnter * call SmartInsert()
      '';
    };
}
