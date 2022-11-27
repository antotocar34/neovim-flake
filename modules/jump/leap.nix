{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.leap;
  writeIf = cond: message: if cond then message else "";
in {
  options.vim.leap = {
    enable = mkEnableOption "enable leap";
  };

  config = mkIf cfg.enable {
      vim.startPlugins = with pkgs.neovimPlugins; [ leap ];

      vim.luaConfigRC = writeIf cfg.enable ''
        require('leap').add_default_mappings()
      '';
  };
}
