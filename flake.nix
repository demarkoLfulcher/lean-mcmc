{
  description = "lean-mcmc";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    lean4.url = "github:leanprover/lean4";
  };

  outputs = { self, nixpkgs, lean4 }:
    let
      system = "x86_64-linux"; 
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        name = "lean-dev-shell";

        buildInputs = with pkgs; [
          elan 
          git
        ];
      };
    };
}
