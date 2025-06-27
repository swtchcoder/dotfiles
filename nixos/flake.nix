{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./default.nix
          ./desktop.nix
        ];
      };

      server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./default.nix
          ./server.nix
        ];
      };
    };
  };
}
