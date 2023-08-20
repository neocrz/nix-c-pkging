{
  description = "C";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
      pkgs = nixpkgs.legacyPackages.${system};
      in
      
      let
        bnatives = with pkgs; [ gcc SDL2 pkg-config SDL2.dev raylib ];
        binputs = with pkgs; [  ];
      in
      let
        sinputs = binputs ++ (with pkgs; [ gnumake cmake ]);
      in
      {
        packages = rec {
          hello = pkgs.hello;
          default = hello;
          bsdl = pkgs.callPackage ./bsdl.nix { inherit binputs; inherit bnatives; };
          bray = pkgs.callPackage ./bray.nix { inherit binputs; inherit bnatives; };
        };
        apps = rec {
          hello = flake-utils.lib.mkApp { drv = self.packages.${system}.hello; };
          default = hello;
          bsdl = flake-utils.lib.mkApp { drv = self.packages.${system}.bsdl; };
          bray = flake-utils.lib.mkApp { drv = self.packages.${system}.bray; };
        };
        devShells = rec {
          default = import ./shell.nix { inherit sinputs; inherit bnatives; inherit pkgs; };
        }; 
      }
    );
}