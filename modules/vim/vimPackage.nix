{ symlinkJoin, makeWrapper, neovim, vimPlugins }:

let
  # Automatically loaded when neovim launches
  autoloadedPlugins = with vimPlugins; [ ];

  # Manually loaded by calling `:packadd <plugin>`
  manualPlugins = with vimPlugins; [ ];

  customizedVim = neovim.override {
    configure = {
      customRC = ''
        lua require('init')
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
