{
  description = "Ruxy neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    gen = {
      flake = false;
      url = "github:David-Kunz/gen.nvim";
    };
  };

  outputs = inputs @ { self, flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = {
        lib = import ./lib {inherit inputs;};
      };
    systems = ["aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux"];

    perSystem = {
      config,
      self',
      inputs',
      pkgs,
      system,
      ...
    }: let
      inherit (pkgs) alejandra mkShell;
    in {
      apps = {
        nvim = {
          program = "${config.packages.neovim}/bin/nvim";
          type = "app";
        };
      };

      devShells = {
        default = mkShell {
          buildInputs = [  ];
        };
      };

      formatter = alejandra;

      packages = {
        default = self.lib.mkVimPlugin {inherit system;};
        neovim = self.lib.mkNeovim {inherit system;};
      };
    };
  };
}
