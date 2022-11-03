{ isMaximal }:

{
        theme = {
          enable = true;
          name = "onedark";
          style="darker";
        };
        statusline.lualine = {
          enable = true;
          theme = "onedark";
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
            enable = true;
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
        };
        markdown = {
          enable = true;
          glow.enable = true;
        };
        git = {
          enable = true;
          gitsigns.enable = true;
        };
  }
