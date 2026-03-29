{
  description = "Valorant web radar flake";

  # Flake inputs
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0"; # Stable Nixpkgs (use 0.1 for unstable)
    utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };
  # Flake outputs
  outputs =
    {
      self,
      nixpkgs,
      utils,
      rust-overlay,
      ...
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        buildTarget = "wasm32-unknown-unknown";

        packageName = "valorant-web-radar";

        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            rust-overlay.overlays.default
          ];
        };

        rustToolchain = pkgs.rust-bin.stable.latest.default.override {
          targets = [ buildTarget ];
        };

        rustPlatform = pkgs.makeRustPlatform {
          cargo = rustToolchain;
          rustc = rustToolchain;
        };

      in
      {
        packages.default = rustPlatform.buildRustPackage {
          name = packageName;
          src = ./.;

          cargoLock.lockFile = ./Cargo.lock;
        };
        # Development environments output by this flake

        # To activate the default environment:
        # nix develop
        # Or if you use direnv:
        # direnv allow
        devShells.default = pkgs.mkShell {
          # Run `nix develop` to activate this environment or `direnv allow` if you have direnv installed
          # The Nix packages provided in the environment
          buildInputs = with pkgs; [
            # Add the flake's formatter to your project's environment
            rustToolchain
            pkg-config
            openssl
            nodejs
            node2nix
            webpack-cli
            wasm-pack
          ];

          # Set any environment variables for your development environment
          env = { };

          # Add any shell logic you want executed when the environment is activated
          shellHook = "";
        };

      }
    );

}
