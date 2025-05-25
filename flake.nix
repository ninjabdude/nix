{
    description = "public nix config";
    
    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
	home-manager.url = "github:nix-community/home-manager";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
	
    };
    
    outputs = inputs@{ self, nixpkgs, home-manager, ...}: {

        homeConfigurations = {
          aarch64-darwin = self.lib.mkHomeManager {system = "aarch64-darwin";};
          aarch64-linux = self.lib.mkHomeManager {system = "aarch64-linux";};
          x86_64-darwin = self.lib.mkHomeManager {system = "x86_64-darwin";};
          x86_64-linux = self.lib.mkHomeManager {system = "x86_64-linux";};
        };

    };
    
}
