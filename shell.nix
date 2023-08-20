{ pkgs, sinputs, bnatives, ...}:

with pkgs;
mkShell {
  nativeBuildInputs = bnatives;
  buildInputs = sinputs;

  shellHook = ''
    # ...
  '';
}