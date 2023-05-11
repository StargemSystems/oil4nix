{inputs, cell}:
let
  inherit (inputs) nixpkgs std;
  l = nixpkgs.lib // builtins;
  p = cell.packages;
in {

  default = p.oils;
  oils-for-unix = p.oils;

  oils = with nixpkgs;
    oil.overrideAttrs (old: rec {
      configureFlags = ["--readline=${readline}" "--datarootdir=$out"];
      version = "0.15.0";
      src = fetchurl {
        url = "https://www.oilshell.org/download/oil-${version}.tar.xz";
        hash = "sha256-1oYP/sRhYG2oJYY80WOxqSXwqyUMbjIZdznBHcnGMxg=";
      };
    });
}
