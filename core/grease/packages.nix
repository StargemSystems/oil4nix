{inputs, cell}:
let
  inherit (inputs) nixpkgs std;
  l = nixpkgs.lib // builtins;
in {
  grease = nixpkgs.stdenv.mkDerivation rec {
    pname = "grease";
    version = "0.3.3";
    src = ./library.oil;
    dontUnpack = true;
    buildInputs = with nixpkgs; [
      inputs.cells.oils-for-unix.packages.oils
      ripgrep
      jq
      jo
      bc
    ];
    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/${pname}
      chmod +x $out/bin/${pname}
    '';
  };
}
