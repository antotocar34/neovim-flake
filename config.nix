{ isMaximal }:

{
        theme = {
          enable = true;
          name = "nord";
          style="";
          extraLuaConfig = ''
            vim.g.nord_contrast = true
            vim.g.nord_italic = false
            vim.g.nord_bold = false
          '';
        };
        statusline.lualine = {
          enable = true;
        };
        viAlias = false;
        vimAlias = true;
        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
          lspsaga.enable = false;
          nvimCodeActionMenu.enable = true;
          trouble.enable = true;
          lspSignature.enable = true;
          nix = true;
          python = true;
          clang.enable = false;
          sql = true;
          ts = false;
          go = false;
          hare = false;
        };
        visuals = {
          enable = true;
          nvimWebDevicons.enable = true;
          lspkind.enable = true;
          indentBlankline = {
            enable = false;
            fillChar = "";
            eolChar = "";
            showCurrContext = true;
          };
          cursorWordline = {
            enable = true;
            lineTimeout = 0;
          };
        };
        autopairs.enable = true;
        autocomplete = {
          enable = true;
          type = "nvim-cmp";
        };
        filetree.nvimTreeLua = {
          enable = true ;
          closeOnFileOpen = true ;
          openOnSetup = false;
          keyToggle = "-";
        };
        tabline.nvimBufferline.enable = false;
        treesitter = {
          enable = true;
          context.enable = true;
        };
        keys = {
          enable = true;
          whichKey.enable = true;
        };
        telescope = {
          enable = true;
          subKey = "<leader>j";
          keyFindFiles = "f";
          keyGitFindFiles = "g";
          keyGitLiveGrep = "s";
          keyGitGrepString = "w";
          keyBuffers = "b";
          keyLiveGrep = "l";
          keyHelpTags = "h";
          keyPickers = "t";
        };
        markdown = {
          enable = true;
          glow.enable = true;
        };
        git = {
          enable = true;
          gitsigns.enable = true;
        };
        vim-floaterm = {
          enable = true;
        };

        ## Keybindings
        nnoremap."<C-q>"=":q<CR>";
        nnoremap."Y"=''"+y'';
        vnoremap."Y"=''"+y'';
        vnoremap."<C-s>"="<Esc>:update <CR>";
        nnoremap."<C-s>"="<Esc>:update <CR>";

        # " This is a spell check from gilles castel blog
        # https://castel.dev/post/lecture-notes-1/
        inoremap."<C-l>" = "<c-g>u<Esc>[s1z=`]a<c-g>u";
        # Toggle spell checking
        nnoremap."<leader>o" = "<cmd>set invspell<CR>";

        # Buffer remaps
        nnoremap."<leader>l"=":bn<CR>";
        nnoremap."<leader>h"=":bp<CR>";
        nnoremap."<leader>q"=":bd<CR>";

        imap."<C-e>"="<C-o>zz";
  }
