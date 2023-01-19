{ symlinkJoin, makeWrapper, neovim, vimPlugins }:

let
  # Automatically loaded when neovim launches
  autoloadedPlugins = with vimPlugins; [
    catppuccin-nvim
    cmp-buffer
    cmp-cmdline
    cmp-nvim-lsp
    cmp-nvim-lsp
    cmp-path
    cmp_luasnip
    luasnip
    nvim-cmp
    nvim-lspconfig
    nvim-treesitter.withAllGrammars
  ];

  # Manually loaded by calling `:packadd <plugin>`
  manualPlugins = with vimPlugins; [ ];

  customizedVim = neovim.override {
    configure = {
      customRC = ''
        lua require('init')
        lua require('completions')
        lua require('lsp')
        lua require('treesitter')
      '';

      packages.myVimPackage = {
        start = autoloadedPlugins;
        opt = manualPlugins;
      };
    };

    vimAlias = true;
    viAlias = true;
  };
in
symlinkJoin {
  name = "vim";
  buildInputs = [ makeWrapper ];
  paths = [ customizedVim ];
}
