{ pkgs }:

with pkgs;
stdenv.mkDerivation {
  name = "env";
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    cryptsetup
  ];
}