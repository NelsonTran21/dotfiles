{ pkgs }:

with pkgs;
stdenv.mkDerivation rec {
  name = "qmk-firmware";

  src = fetchgit {
    url = "https://github.com/NelsonTran21/qmk_firmware";
    rev = "181cf318a4ca17d7596451b7bc4080ffdd6ba838";
    sha256 = "ju19MamSnSL7pQzJbnZ6i0BMoE+6dfWLUVIqTf7I3O4=";
    fetchSubmodules = true;
    leaveDotGit = true;
  };

  buildInputs = (import "${src}/shell.nix" { }).buildInputs;

  prePatch = ''
    # Patch the shebang so that it works in the context of `nix build`.
    substituteInPlace bin/qmk --replace '/usr/bin/env python3' $(type -p python)

    mkdir -pv users/NelsonTran21
    cp -rv ${./userspace}/* users/NelsonTran21/

    mkdir -pv keyboards/boardwalk/keymaps/NelsonTran21
    cp -rv ${./keymaps/boardwalk}/* keyboards/boardwalk/keymaps/NelsonTran21/

    mkdir -pv keyboards/cannonkeys/atlas/keymaps/NelsonTran21
    cp -rv ${./keymaps/atlas}/* keyboards/cannonkeys/atlas/keymaps/NelsonTran21/

    mkdir -pv keyboards/foostan/cornelius/keymaps/NelsonTran21
    cp -rv ${./keymaps/cornelius}/* keyboards/foostan/cornelius/keymaps/NelsonTran21/

    mkdir -pv keyboards/wilba_tech/wt65_c/keymaps/NelsonTran21
    cp -rv ${./keymaps/thermal}/* keyboards/wilba_tech/wt65_c/keymaps/NelsonTran21/
  '';

  buildPhase = ''
    make boardwalk:NelsonTran21
    make cannonkeys/atlas:NelsonTran21
    make foostan/cornelius:NelsonTran21
    make wilba_tech/wt65_c:NelsonTran21
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ./boardwalk_NelsonTran21.* $out/bin/
    cp ./cannonkeys_atlas_NelsonTran21.* $out/bin/
    cp ./foostan_cornelius_NelsonTran21.* $out/bin/
    cp ./wilba_tech_wt65_c_NelsonTran21.* $out/bin/
  '';
}
