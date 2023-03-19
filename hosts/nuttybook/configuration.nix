{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../../modules/options.nix
    ../../modules/config.darwin.nix
    ../../modules/config.nix
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = "experimental-features = nix-command flakes";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Allow unfree package installation.
  nixpkgs.config.allowUnfree = true;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  modules = {
    alacritty.enable = true;
    bat.enable = true;
    chrome.enable = true;
    direnv.enable = true;
    discord.enable = true;
    docker.enable = true;
    dropbox.enable = true;
    exa.enable = true;
    fd.enable = true;
    figma.enable = true;
    fish.enable = true;
    flux.enable = true;
    fonts.enable = true;
    fzf.enable = true;
    geforce.enable = true;
    git.enable = true;
    home.enable = true;
    homebrew.enable = true;
    htop.enable = true;
    jq.enable = true;
    just.enable = true;
    kitty.enable = true;
    kmonad.enable = true;
    lua.enable = true;
    macos.enable = true;
    nix.enable = true;
    node.enable = true;
    obsidian.enable = true;
    one-password.enable = true;
    prettyping.enable = true;
    qmk.enable = true;
    raycast.enable = true;
    ripgrep.enable = true;
    supabase.enable = true;
    tailscale.enable = true;
    tldr.enable = true;
    tmux.enable = true;
    vim.enable = true;
    vscode.enable = true;
    zotero.enable = true;
  };
}
