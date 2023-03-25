{ config, lib, ... }:

with lib;
mkIf config.modules.fish.enable {
  programs.fish.enable = true;
  programs.fish.shellInit =
    let
      source = path: [ "source ${path}" ];
      sourceIf = isEnabled: path: optionals isEnabled (source path);
    in
    concatStringsSep "\n" (
      source ./init.fish ++
      source ./greeting.fish ++
      source ./prompt.fish ++

      sourceIf config.modules.bat.enable ../bat/init.fish ++
      sourceIf config.modules.direnv.enable ../direnv/init.fish ++
      sourceIf config.modules.exa.enable ../exa/init.fish ++
      sourceIf config.modules.fzf.enable ../fzf/init.fish ++
      sourceIf config.modules.git.enable ../git/init.fish ++
      sourceIf config.modules.prettyping.enable ../prettyping/init.fish ++
      sourceIf config.modules.vim.enable ../vim/init.fish
    );
}
