{ pkgs }:

with pkgs;
stdenv.mkDerivation rec {
  name = "qmk-firmware";

  src = fetchgit {
    url = "https://github.com/qmk/qmk_firmware";
    rev = "99e9e1b8e70b7b6a0cc03a6672f2512b472fb650";
    sha256 = "fjsbr/IY+90bdtG6rsqtjkMs8SyfNJju4MmR3s66HPE=";
    fetchSubmodules = true;
    leaveDotGit = true;
  };

  buildInputs = (import "${src}/shell.nix" { }).buildInputs;

  prePatch = ''
    mkdir -pv users/NelsonTran21
    cp -rv ${./userspace}/* users/NelsonTran21/

    mkdir -pv keyboards/boardwalk/keymaps/NelsonTran21
    cp -rv ${./keymaps/boardwalk}/* keyboards/boardwalk/keymaps/NelsonTran21/

    mkdir -pv keyboards/cannonkeys/atlas/keymaps/NelsonTran21
    cp -rv ${./keymaps/atlas}/* keyboards/cannonkeys/atlas/keymaps/NelsonTran21/

    mkdir -pv keyboards/foostan/cornelius/keymaps/NelsonTran21
    cp -rv ${./keymaps/cornelius}/* keyboards/foostan/cornelius/keymaps/NelsonTran21/
  '';

  buildPhase = ''
    make boardwalk:NelsonTran21
    make cannonkeys/atlas:NelsonTran21
    make foostan/cornelius:NelsonTran21
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ./boardwalk_NelsonTran21.* $out/bin/
    cp ./cannonkeys_atlas_NelsonTran21.* $out/bin/
    cp ./foostan_cornelius_NelsonTran21.* $out/bin/
  '';
}
