{
  description = "Development environment with scripts";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      scripts = pkgs.callPackage ./scripts.nix { };
    in {
      devShells.x86_64-linux.default =
        pkgs.mkShell { packages = (with pkgs; [ ] ++ scripts); };
    };
}
