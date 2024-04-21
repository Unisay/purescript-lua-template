{
  description = "Purescript-Lua Flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    easyps.url = "github:justinwoo/easy-purescript-nix";
    pslua.url = "github:Unisay/purescript-lua";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      easyps,
      pslua,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        epkgs = easyps.packages.${system};
        pkgs = nixpkgs.legacyPackages.${system};
        lpkgs = pkgs.lua51Packages;
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            epkgs.purs-0_15_15
            epkgs.purs-tidy
            epkgs.spago
            lpkgs.lua
            lpkgs.luacheck
            pkgs.dhall
            pkgs.dhall-lsp-server
            pkgs.httpie
            pkgs.just
            pkgs.luaformatter
            pkgs.nil
            pkgs.nixfmt-rfc-style
            pkgs.treefmt
            pslua.packages.${system}.default
          ];
        };
      }
    );
}
