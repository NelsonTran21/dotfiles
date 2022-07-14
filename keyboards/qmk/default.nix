{ pkgs }:

with pkgs;
stdenv.mkDerivation rec {
  name = "qmk-firmware";

  src = fetchFromGitHub {
    owner = "qmk";
    repo = "qmk_firmware";
    rev = "20a28d6752ddf70d1c50a6b444bcb9ea74ea399a";
    sha256 = "N64ralh295DUj/HdkwC/DCs7idd24na2r4i0dfRwxYc=";
    fetchSubmodules = true;
  };

  buildInputs = [
    which
  ] ++ (import "${src}/shell.nix" { }).buildInputs;

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
