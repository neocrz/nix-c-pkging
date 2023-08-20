{stdenv, binputs, bnatives, ...}:
let 
  pname = "bray";
in
stdenv.mkDerivation {
  inherit pname;
  version = "0.0.1";

  src = ./src/${pname};
  nativeBuildInputs = binputs;
  buildInputs = bnatives;

  buildPhase = ''
    gcc -o ${pname} `pkg-config sdl2 raylib --cflags --libs` main.c
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv ${pname} $out/bin/
  '';
}