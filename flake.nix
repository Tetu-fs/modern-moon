{
  description = "Modern Moon Phase App with Bun and Zed";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            bun
            nodePackages.typescript-language-server
            git
            gh
          ];

          shellHook = ''
            echo "🌕 Zed + Bun environment loaded!"
          '';
        };
      });
}
