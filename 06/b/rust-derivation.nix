let

    #pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/0b20bf89e0035b6d62ad58f9db8fdbc99c2b01e8.tar.gz") {};
    pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz") {};

in 
    pkgs.stdenv.mkDerivation {

        name = "rust-hello-1.0";

        src = ./rust-hello;

        #system = "x86_64-linux";
        system = "aarch64-darwin";

        # Download dependencies that need to run on the system building the package, and produce output suitable for the system intended to run the package
        nativeBuildInputs = [ pkgs.cargo ]; 

        # where you should run commands to build your software
        buildPhase = '' 
        cargo build --release
        '';
        #dontUnpack = true;
        installPhase = ''
        mkdir -p $out/bin
        cp target/release/rust-hello $out/bin/rust-hello
        chmod +x $out
        '';
    }
