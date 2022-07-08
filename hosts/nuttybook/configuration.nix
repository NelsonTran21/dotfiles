{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../../modules/homebrew
    ../../modules
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Allow unfree package installation.
  nixpkgs.config.allowUnfree = true;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  modules = {
    bat.enable = true;
    chrome.enable = true;
    discord.enable = true;
    dotnet.enable = true;
    exa.enable = true;
    fd.enable = true;
    fish.enable = true;
    fzf.enable = true;
    geforce.enable = true;
    git.enable = true;
    home.enable = true;
    homebrew.enable = true;
    htop.enable = true;
    hue.enable = true;
    iosevka.enable = true;
    jetbrains.enable = true;
    jq.enable = true;
    linear.enable = true;
    logitech.enable = true;
    macos.enable = true;
    nix.enable = true;
    node.enable = true;
    obsidian.enable = true;
    password.enable = true;
    postgresql.enable = true;
    prettyping.enable = true;
    python.enable = true;
    qmk.enable = true;
    raspberry-pi.enable = true;
    raycast.enable = true;
    rclone.enable = true;
    ripgrep.enable = true;
    skhd.enable = true;
    steam.enable = true;
    tldr.enable = true;
    vim.enable = true;
    vscode.enable = true;
    warp.enable = true;
    yabai.enable = true;
  };
}
