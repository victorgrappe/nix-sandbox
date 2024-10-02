{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11-darwin";

  outputs = {
    self,
    nixpkgs,
  }: let
    #system = "x86_64-linux";
    system = "aarch64-darwin";
    pkgs = import nixpkgs {inherit system;};
  in {
    packages.${system}.default =
      pkgs.stdenv.mkDerivation
      {
        src = ./rust-hello;
        name = "rust-hello-1.1";
        
        inherit system;
        
        nativeBuildInputs = [pkgs.cargo];

        buildPhase = ''
          cargo build --release
        '';
        
        installPhase = ''
          mkdir -p $out/bin
          cp target/release/rust-hello $out/bin/rust-hello
          chmod +x $out
        '';
      };
  };
}
