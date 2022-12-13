{isMaximal}: {
  theme = {
    enable = true;
    name = "nord";
    style = "";
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
  noHlsearch = true;

  lsp = {
    enable = true;
    formatOnSave = false;
    lightbulb.enable = true;
    lspsaga.enable = false;
    nvimCodeActionMenu.enable = true;
    trouble.enable = true;
    lspSignature.enable = false;
    toggle-diagnostics.enable = true;
    toggle-diagnostics.start_on = false;
    nix = true;
    python = true;
    clang.enable = false;
    rust.enable = false;
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
    enable = true;
    closeOnFileOpen = true;
    openOnSetup = false;
    keyToggle = "-";
  };

  tabline.nvimBufferline.enable = false;

  treesitter = {
    enable = false;
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
    keyKeyMaps = "k";
    plugins = {
      # TODO fix
      telescope-manix.enable = false;
    };
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

  vimwiki = {
    enable = true;
    wikiPath = "~/Documents/Notes/vimwiki";
  };

  filetype = {
    tex.enable = true;
    nix.enable = true;
  };

  repl = {
    vim-slime.enable = true;
  };

  leap.enable = true;

  snippets.ultisnips = {
    enable = true;
    snippetDirectory = "/home/carneca/.config/nixpkgs/extraConfigs/.config/nvim/my-snippets/";
  };

  ## Keybindings
  nnoremap."<C-q>" = ":q<CR>";
  nnoremap."Y" = ''"+y'';
  vnoremap."Y" = ''"+y'';
  vnoremap."<C-s>" = "<Esc>:update <CR>";
  nnoremap."<C-s>" = "<Esc>:update <CR>";

  # " This is a spell check from gilles castel blog
  # https://castel.dev/post/lecture-notes-1/
  inoremap."<C-l>" = "<c-g>u<Esc>[s1z=`]a<c-g>u";
  # Toggle spell checking
  nnoremap."<leader>o" = "<cmd>set invspell<CR>";

  # Buffer remaps
  nnoremap."<leader>l" = ":bn<CR>";
  nnoremap."<leader>h" = ":bp<CR>";
  nnoremap."<leader>q" = ":bd<CR>";

  imap."<C-e>" = "<C-o>zz";

  configRC = ''
    augroup highlight_yank
     autocmd!
     au TextYankPost * silent! lua vim.highlight.on_yank{timeout=200}
    augroup END
  '';
}
