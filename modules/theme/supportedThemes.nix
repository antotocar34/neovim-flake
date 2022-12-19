{
  config,
  pkgs,
  lib,
  ...
}:
let
  l = lib // builtins;
  t = l.types;
  themeSubmodule.options = {
    setup = l.mkOption {
      type = t.functionTo t.str;
      description = "Lua code to initialize theme";
    };
    styles = l.mkOption {
      type = t.listOf t.str;
      default = [];
    };
  };
in
{
  options.vim.theme = {
    supportedThemes = l.mkOption {
      type = t.attrsOf (t.submodule themeSubmodule);
      description = "Supported themes";
    };
  };

  config.vim.theme.supportedThemes = {
    onedark = {
      setup = { style ? "dark" }: ''
        -- OneDark theme
        require('onedark').setup {
        style = "${style}"
        }
        require('onedark').load()
      '';
      styles = [ "dark" "darker" "cool" "deep" "warm" "warmer" ];
    };

    tokyonight = {
      setup = { style ? "night" }: ''
        -- need to set style before colorscheme to apply
        vim.g.tokyonight_style = '${style}'
        vim.cmd[[colorscheme tokyonight]]
      '';
      styles = [ "day" "night" "storm" ];
    };

    catppuccin = {
      setup = { style ? "mocha" }: ''
        -- Catppuccin theme
        require('catppuccin').setup {
        flavour = "${style}"
        }
        -- setup must be called before loading
        vim.cmd.colorscheme "catppuccin"
      '';
      styles = [ "latte" "frappe" "macchiato" "mocha" ];
    };
  };
}
