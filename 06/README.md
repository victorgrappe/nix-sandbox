
<https://tonyfinn.com/blog/nix-from-first-principles-flake-edition/nix-6-nixpkgs-not-reinventing-the-wheel/>

# a

```bash
nix build -f derivation-stdenv.nix
```

# b

```bash
# Get Cargo (Rust's build tool/package manager) from Nix and have it scaffold a Rust project for this example
# (Unlike nix profile install, the downloaded version of cargo isn't kept around permanently - it will be deleted at the next GC)
nix run nixpkgs#cargo init rust-hello

# Build
nix build -f rust-derivation.nix

# Run
result/bin/rust-hello
```

# c

```bash
nix build -f shell-app.nix
```
