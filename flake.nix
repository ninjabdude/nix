{
    description = "public nix config";
    
    inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
	home-manager.url = "github:nix-community/home-manager";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";
	
	determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    };
    
    outputs = { self, nixpkgs, home-manager, determinate, ...}: {
	homeConfigurations = {
	    ninjabdude = home-manager.lib.homeManagerConfiguration{
		pkgs = nixpkgs.legacyPackages.
	    };
	};
    };
}
