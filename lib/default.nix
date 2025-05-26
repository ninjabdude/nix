{inputs}:
let
    defaultUsername = "bb";
    
    defaultHomePath = "/home";

    impureSystem = builtins.currentSystem;

    defaultConfig = "bb";
in 
{
    mkHomeManager = {
	system ? impureSystem,
	username ? defaultUsername,
	config ? defaultConfig, 
    }: 
    let
	homeDirectory =
	    if system == "aarch64-darwin" || system == "x86_64-darwin"
	    then "/Users/${username}"
	    else "${defaultHomePath}/${username}";
    in
	inputs.home-manager.lib.homeManagerConfiguration {
	   pkgs = inputs.nixpkgs.legacyPackages.${system};
	   modules = [(import ../users/${config}.nix { inherit homeDirectory username; })]; 
	};


}
