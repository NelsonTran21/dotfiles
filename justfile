update:
   nix flake update

switch:
   darwin-rebuild switch --flake .

keyboards:
   nix build .#keyboards
