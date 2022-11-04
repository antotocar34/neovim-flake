{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.telescope;
in {
  options.vim.telescope = {
    enable = mkEnableOption "enable telescope";

    subKey = mkOption {
      type = types.str;
      description = "Keybinding to initialize Telescope commands";
    };
  };

  config = mkIf (cfg.enable) {
    vim.startPlugins = with pkgs.neovimPlugins; [
      telescope
    ];

    vim.nnoremap =
      {
        "${cfg.subKey}f" = "<cmd> Telescope find_files<CR>";
        "${cfg.subKey}g" = "<cmd> Telescope live_grep<CR>";
        "${cfg.subKey}b" = "<cmd> Telescope buffers<CR>";
        "${cfg.subKey}h" = "<cmd> Telescope help_tags<CR>";
        "${cfg.subKey}t" = "<cmd> Telescope<CR>";

        "${cfg.subKey}vcw" = "<cmd> Telescope git_commits<CR>";
        "${cfg.subKey}vcb" = "<cmd> Telescope git_bcommits<CR>";
        "${cfg.subKey}vb" = "<cmd> Telescope git_branches<CR>";
        "${cfg.subKey}vs" = "<cmd> Telescope git_status<CR>";
        "${cfg.subKey}vx" = "<cmd> Telescope git_stash<CR>";
      }
      // (
        if config.vim.lsp.enable
        then {
          "${cfg.subKey}lsb" = "<cmd> Telescope lsp_document_symbols<CR>";
          "${cfg.subKey}lsw" = "<cmd> Telescope lsp_workspace_symbols<CR>";

          "${cfg.subKey}lr" = "<cmd> Telescope lsp_references<CR>";
          "${cfg.subKey}li" = "<cmd> Telescope lsp_implementations<CR>";
          "${cfg.subKey}lD" = "<cmd> Telescope lsp_definitions<CR>";
          "${cfg.subKey}lt" = "<cmd> Telescope lsp_type_definitions<CR>";
          "${cfg.subKey}ld" = "<cmd> Telescope diagnostics<CR>";
        }
        else {}
      )
      // (
        if config.vim.treesitter.enable
        then {
          "${cfg.subKey}s" = "<cmd> Telescope treesitter<CR>";
        }
        else {}
      );

    vim.luaConfigRC = ''
      require("telescope").setup {
        defaults = {
          vimgrep_arguments = {
            "${pkgs.ripgrep}/bin/rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
          },
          pickers = {
            find_command = {
              "${pkgs.fd}/bin/fd",
            },
          },
        }
      }
    '';
  };
}
