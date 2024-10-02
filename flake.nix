{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-21.11-darwin";
      #url = "github:nixos/nixpkgs?ref=nixos-unstable"; # Original
      #url = "github:NixOS/nixpkgs/nixos-23.11"; # Super long à compiler
    };
  };

  outputs = { self, nixpkgs }: {

    packages = {
      
      x86_64-linux = {
        
        hello = nixpkgs.legacyPackages.x86_64-linux.hello;

        default = self.packages.x86_64-linux.hello;
      };

      aarch64-darwin = {
        
        hello = nixpkgs.legacyPackages.aarch64-darwin.hello;

        default = self.packages.aarch64-darwin.hello;
      };
    };

  };
}
