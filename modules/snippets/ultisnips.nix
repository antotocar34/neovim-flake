{
  pkgs,
  config,
  lib,
  ...
}@args:
let
  l = lib // builtins ;
  cfg = config.vim.snippets.ultisnips;

in
{
  options.vim.snippets.ultisnips = {
    enable = l.mkEnableOption "Enable ultisnips";

    snippetDirectory = l.mkOption {
      description = "Path to directory where .snippet exist";
      type = l.types.str;
    };

    expandTrigger = lib.mkOption {
        type = l.types.str ;
        default = "<tab>";
        description = "Key to expand snippet";
    };

  };

  config = l.mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [ultisnips];

    vim.luaConfigRC = ''
      vim.g.UltiSnipsExpandTrigger = '${cfg.expandTrigger}'
      -- vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
      -- vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
      vim.g.UltiSnipsSnippetDirectories = {'${cfg.snippetDirectory}'}
    '';
  };
}
