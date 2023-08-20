{stdenv, binputs, bnatives, ...}:
let 
  pname = "bsdl";
in
stdenv.mkDerivation {
  inherit pname;
  version = "0.0.1";

  src = ./src/${pname};
  
  nativeBuildInputs = bnatives;
  buildInputs = binputs;

  buildPhase = ''
    gcc -o ${pname} `sdl2-config --cflags --libs` main.c
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv ${pname} $out/bin/
  '';
}