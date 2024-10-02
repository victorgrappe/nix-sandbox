<https://tonyfinn.com/blog/nix-from-first-principles-flake-edition/>

```bash
# Build flake.nix
nix build

# Show result
ls -la result/bin
ls -la result/share

# Run default program
result/bin/hello
nix run
nix run .

# Run default program
nix run .#hello

```
