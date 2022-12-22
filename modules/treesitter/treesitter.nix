{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.treesitter;
in {
  options.vim.treesitter = {
    enable = mkOption {
      default = false;
      type = types.bool;
      description = "enable tree-sitter [nvim-treesitter]";
    };

    fold = mkOption {
      default = false;
      type = types.bool;
      description = "enable fold with tree-sitter";
    };

    autotagHtml = mkOption {
      default = false;
      type = types.bool;
      description = "enable autoclose and rename html tag [nvim-ts-autotag]";
    };

    highlight.enable = mkEnableOption "Enable treesitter highlighting";

    grammars = mkOption {
      type = with types; listOf package;
      default = with (pkgs.tree-sitter-grammars); [
        tree-sitter-c
        tree-sitter-cpp
        tree-sitter-nix
        tree-sitter-python
        tree-sitter-rust
        tree-sitter-markdown
        tree-sitter-comment
        tree-sitter-toml
        tree-sitter-make
        tree-sitter-tsx
        tree-sitter-html
        tree-sitter-javascript
        tree-sitter-css
        tree-sitter-graphql
        tree-sitter-json
        tree-sitter-zig
      ];
      description = ''
        List of treesitter grammars to install.
        When enabling a language, its treesitter grammar is added for you.
      '';
    };
  };

  config = mkIf cfg.enable (
    let
      writeIf = cond: msg:
        if cond
        then msg
        else "";
    in {
      vim.startPlugins = [
        "nvim-treesitter"
        (
          if cfg.autotagHtml
          then "nvim-ts-autotag"
          else null
        )
      ];

      # For some reason treesitter highlighting does not work on start if this is set before syntax on
      vim.configRC.treesitter = writeIf cfg.fold (nvim.dag.entryBefore ["basic"] ''
        " Tree-sitter based folding
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
        set nofoldenable
      '');

      vim.luaConfigRC.treesitter = nvim.dag.entryAnywhere ''
        -- Treesitter config
        require'nvim-treesitter.configs'.setup {
          highlight = {
            enable = ${boolToString cfg.highlight.enable},
            disable = {},
          },

          auto_install = false,
          ensure_installed = {},

          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "gnn",
              node_incremental = "grn",
              scope_incremental = "grc",
              node_decremental = "grm",
            },
          },

          ${writeIf cfg.autotagHtml ''
          autotag = {
            enable = true,
          },
        ''}
        }
      '';
    }
  );
}
